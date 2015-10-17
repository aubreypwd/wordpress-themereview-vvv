printf "\nCommencing Setup Theme Review\n"

# If we delete htdocs, let's just start over.
if [ ! -d htdocs ]
then

	printf "Creating directory htdocs for Theme review...\n"
	mkdir htdocs
	cd htdocs

	# **
	# Database
	# **

	# Create the database over again.
	printf "(Re-)Creating database 'wordpress_themereview'...\n"
	mysql -u root --password=root -e "DROP DATABASE IF EXISTS \`wordpress_themereview\`"
	mysql -u root --password=root -e "CREATE DATABASE IF NOT EXISTS \`wordpress_themereview\`"
	mysql -u root --password=root -e "GRANT ALL PRIVILEGES ON \`wordpress_themereview\`.* TO wp@localhost IDENTIFIED BY 'wp';"

	# **
	# WordPress
	# **

	# Download WordPress
	printf "Downloading WordPress in htdocs...\n"
	wp core download

	# Install WordPress.
	printf "Creating wp-config in htdocs...\n"
	wp core config --dbname="wordpress_themereview" --dbuser=wp --dbpass=wp --dbhost="localhost" --extra-php <<PHP
define( 'WP_DEBUG', true );
define( 'SCRIPT_DEBUG', true );
define( 'WP_DEBUG_LOG', true );
PHP

	# Install into DB
	wp core install --url=themereview.wordpress.dev --title="A WordPress Theme Reviewers VVV" --admin_user=admin --admin_password=password --admin_email=changme@changeme.com

	# **
	# Your themes
	# **
	printf 'Installing themes...\n'
	for i in `ls ../*.zip`
	do
		wp theme install $i
	done

	# **
	# # Plugins
	# **

	printf 'Installing plugins...\n'
	wp plugin install wordpress-importer --activate
	wp plugin install developer --activate
	wp plugin install theme-check --activate
	wp plugin install theme-mentor --activate
	wp plugin install theme-checklist --activate
	wp plugin install what-the-file --activate
	wp plugin install vip-scanner --activate
	wp plugin install wordpress-database-reset --activate
	wp plugin install toolbar-theme-switcher --activate
	wp plugin install rtl-tester
	wp plugin install piglatin
	wp plugin install debug-bar  --activate
	wp plugin install debug-bar-console  --activate
	wp plugin install debug-bar-cron  --activate
	wp plugin install debug-bar-extender  --activate
	wp plugin install rewrite-rules-inspector  --activate
	wp plugin install log-deprecated-notices  --activate
	wp plugin install log-viewer  --activate
	wp plugin install monster-widget  --activate
	wp plugin install user-switching  --activate
	wp plugin install regenerate-thumbnails  --activate
	wp plugin install simply-show-ids  --activate
	wp plugin install theme-test-drive  --activate
	wp plugin install wordpress-beta-tester  --activate

	# **
	# Unit Data
	# **

	# Import the unit data.
	printf 'Installing unit test data...\n'
	curl -O https://wpcom-themes.svn.automattic.com/demo/theme-unit-test-data.xml
	wp import theme-unit-test-data.xml --authors=create
	rm theme-unit-test-data.xml

	# Replace url from unit data
	printf 'Adjusting urls in database...\n'
	wp search-replace 'wpthemetestdata.wordpress.com' 'themereview.wordpress.dev' --skip-columns=guid

	cd ..

else

	cd htdocs/

	# Updates
	if $(wp core is-installed); then

		# Update WordPress.
		printf "Updating WordPress for Theme Review...\n"
		wp core update
		wp core update-db

		# Update Plugins
		printf "Updating plugins for Theme Review...\n"
		wp plugin update --all

		# **
		# Your themes
		# **
		printf "Installing themes for Theme Review...\n"
		for i in `ls ../*.zip`
		do
			wp theme install $i
		done

	fi

	cd ..

fi
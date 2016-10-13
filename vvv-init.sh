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
	wp core download --allow-root

	# Install WordPress.
	printf "Creating wp-config in htdocs...\n"
	wp core config --dbname="wordpress_themereview" --dbuser=wp --dbpass=wp --dbhost="localhost" --allow-root --extra-php <<PHP
define( 'WP_DEBUG', true );
define( 'SCRIPT_DEBUG', true );
define( 'WP_DEBUG_LOG', true );
PHP

	# Install into DB
	wp core install --url=themereview.wordpress.dev --title="A WordPress Theme Reviewers VVV" --admin_user=admin --admin_password=password --admin_email=changme@changeme.com --allow-root

	# **
	# Your themes
	# **
	printf 'Installing themes...\n'
	for i in `ls ../*.zip`
	do
		wp theme install $i --allow-root
	done

	# **
	# # Plugins
	# **

	printf 'Installing plugins...\n'
	wp plugin install wordpress-importer --activate --allow-root
	wp plugin install developer --activate --allow-root
	wp plugin install theme-check --activate --allow-root
	wp plugin install theme-mentor --activate --allow-root
	wp plugin install theme-checklist --activate --allow-root
	wp plugin install what-the-file --activate --allow-root
	wp plugin install vip-scanner --activate --allow-root
	wp plugin install wordpress-database-reset --activate --allow-root
	wp plugin install rtl-tester --allow-root
	wp plugin install piglatin --allow-root
	wp plugin install debug-bar  --activate --allow-root
	wp plugin install debug-bar-console  --activate --allow-root
	wp plugin install debug-bar-cron  --activate --allow-root
	wp plugin install debug-bar-extender  --activate --allow-root
	wp plugin install rewrite-rules-inspector  --activate --allow-root
	wp plugin install log-deprecated-notices  --activate --allow-root
	wp plugin install log-deprecated-notices-extender  --activate --allow-root
	wp plugin install log-viewer  --activate --allow-root
	wp plugin install monster-widget  --activate --allow-root
	wp plugin install user-switching  --activate --allow-root
	wp plugin install regenerate-thumbnails  --activate --allow-root
	wp plugin install simply-show-ids  --activate --allow-root
	wp plugin install theme-test-drive  --activate --allow-root
	wp plugin install wordpress-beta-tester  --activate --allow-root

	# **
	# Unit Data
	# **

	# Import the unit data.
	printf 'Installing unit test data...\n'
	curl -O https://wpcom-themes.svn.automattic.com/demo/theme-unit-test-data.xml
	wp import theme-unit-test-data.xml --authors=create --allow-root
	rm theme-unit-test-data.xml

	# Replace url from unit data
	printf 'Adjusting urls in database...\n'
	wp search-replace 'wpthemetestdata.wordpress.com' 'themereview.wordpress.dev' --skip-columns=guid --allow-root

	cd ..

else

	cd htdocs/

	# Updates
	if $(wp core is-installed --allow-root); then

		# Update WordPress.
		printf "Updating WordPress for Theme Review...\n"
		wp core update --allow-root
		wp core update-db --allow-root

		# Update Plugins
		printf "Updating plugins for Theme Review...\n"
		wp plugin update --all --allow-root

		# Update preloaded Themes
		printf "Updating preloaded themes for Theme Review...\n"
		wp theme update --all --allow-root

		# **
		# Your themes
		# **
		printf "Installing themes for Theme Review...\n"
		for i in `ls ../*.zip`
		do
			wp theme install $i --allow-root
		done

	fi

	cd ..

fi

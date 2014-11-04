# If we delete htdocs, let's just start over.
if [ ! -d htdocs ]
then

	# **
	# Database
	# **

	# Create the database over again.
	mysql -u root --password=root -e "DROP DATABASE IF EXISTS wordpress_themereview"
	mysql -u root --password=root -e "CREATE DATABASE IF NOT EXISTS wordpress_themereview"
	mysql -u root --password=root -e "GRANT ALL PRIVILEGES ON wordpress_themereview.* TO wp@localhost IDENTIFIED BY 'wp';"

	# **
	# WordPress
	# **

	# Download WordPress
	mkdir htdocs
	cd htdocs
	wp core download
	cd ..

	# Install WordPress.
	wp core config --dbname="theme_review" --dbuser=wp --dbpass=wp --dbhost="localhost" --extra-php <<PHP
define( 'WP_DEBUG', true );
define( 'SCRIPT_DEBUG', true );
define( 'WP_DEBUG_LOG', true );
PHP

	# Install into DB
	wp core install --url=themereview.wordpress.dev --title="A WordPress Theme Reviewers VVV" --admin_user=admin --admin_password=password --admin_email=changme@changeme.com

	# **
	# Unit Data
	# **

	# Import the unit data.
	curl -O https://wpcom-themes.svn.automattic.com/demo/theme-unit-test-data.xml
	wp import theme-unit-test-data.xml --authors=create
	rm theme-unit-test-data.xml

	# Replace url from unit data
	wp search-replace 'wpthemetestdata.wordpress.com' 'themereview.wordpress.dev' --skip-columns=guid

	# **
	# Plugins
	# **

	# Install Importer.
	wp plugin uninstall hello-dolly --activate
	wp plugin install wordpress-importer --activate
	wp plugin install developer --activate
	wp plugin install theme-check --activate
	wp plugin install theme-mentor --activate
	wp plugin install theme-checklist --activate
	wp plugin install what-the-file --activate
	wp plugin install vip-scanner --activate
	wp plugin install query-monitor --activate
	wp plugin install wordpress-database-reset --activate
	wp plugin install toolbar-theme-switcher --activate
	wp plugin install rtl-tester --activate
	wp plugin install piglatin --activate
	wp plugin install https://github.com/norcross/airplane-mode/archive/master.zip --activate
	wp plugin install https://github.com/afragen/github-updater/archive/master.zip --activate

else

	# Updates
	if $(wp core is-installed); then

		# Update WordPress.
		wp core update
		wp core update-db

		# Update Plugins
		wp plugin update --all

	fi

fi


# # Install Airplane Mode.
# if ! $(wp plugin is-installed airplane-mode); then
# 	# Rename folder name.
# 	cd wp-content/plugins
# 	mv airplane-mode-master airplane-mode
# 	wp plugin activate airplane-mode
# 	cd -
# fi
#
# # Install GitHub Updater.
# if ! $(wp plugin is-installed github-updater); then
# 	# Rename folder name.
# 	cd wp-content/plugins
# 	mv github-updater-master github-updater
# 	wp plugin activate github-updater
# 	cd -
# fi

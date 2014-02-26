# If we delete htdocs, let's just start over.
if [ ! -d htdocs ]
then

	# Create the database over again.
	mysql -u root --password=root -e "DROP DATABASE IF EXISTS wordpress_themereview"
	mysql -u root --password=root -e "CREATE DATABASE IF NOT EXISTS wordpress_themereview"
	mysql -u root --password=root -e "GRANT ALL PRIVILEGES ON wordpress_themereview.* TO wp@localhost IDENTIFIED BY 'wp';"

	# Checkout WordPress.
	svn checkout -q http://svn.automattic.com/wordpress/trunk/ htdocs

	cd htdocs

	# Configure and setup WordPress.
	wp core config --allow-root --dbname="wordpress_themereview" --dbuser=wp --dbpass=wp --dbhost="localhost"
	wp core install --allow-root --url=themereview.wordpress.dev --title="A WordPress Theme Reviewers VVV" --admin_user=admin --admin_password=password --admin_email=changme@changme.com

	# Checkout the developer plugin.
	svn checkout -q http://plugins.svn.wordpress.org/developer/trunk/ wp-content/plugins/developer

		# Activate the developer plugin.
		wp plugin --allow-root activate developer

	# Checkout the theme-check plugin.
	svn checkout -q http://plugins.svn.wordpress.org/theme-check/trunk/ wp-content/plugins/theme-check

		# Activate the theme-check plugin.
		wp plugin --allow-root activate theme-check

	# Install Importer.
	wp plugin install --allow-root wordpress-importer --activate

	# Import the unit data.
	wp import --allow-root ../theme-unit-test-data.xml --authors=create

	cd ..

else
	svn up htdocs
fi
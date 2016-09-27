#!/bin/bash
#
# Source: https://github.com/andrezrv/peasant-vvv-provider/blob/master/provision/init-custom-sql.sh
# Licensed under GPL 2.0
# Last updated/synced: commit d39164ea4633d28cf84beda4187ec05b64f0f200 / Feb 2, 2014
#
# init-custom-sql.sh
#
# Automatically customizes your init-custom.sql file, so you don't have to
# create your database manually.


# If init-custom.sql does not exist, create it from init-custom.sql.example.
if [ ! -f /srv/database/init-custom.sql ]; then
	sudo cp /srv/database/init-custom.sql.sample /srv/database/init-custom.sql
fi

# If "my_database_name" is found into init-custom.sql, just replace all the
# default values. Otherwise, just add our custom sql commands to the end of
# the file. This last thing is specially useful when you have more than one
# website project into your VVV machine.
echo "Writing custom sql commands into /srv/database/init-custom.sql"
if grep -q "my_database_name" /srv/database/init-custom.sql; then
    # Perform replacements.
    sed -i "s/my_database_name/wordpress_themereview/g" /srv/database/init-custom.sql
    sed -i "s/thisuser/wp/g" /srv/database/init-custom.sql
    sed -i "s/thatpass/wp/g" /srv/database/init-custom.sql
    echo " * Custom sql commands were succesfully added."
else
	# If our DB name already exists into init-custom.sql, the we do nothing.
    if grep -q "wordpress_themereview" /srv/database/init-custom.sql; then
    	echo " * /srv/database/init-custom.sql was already set up."
    # If our DB name does not exist into init-custom.sql, then we add our
    # custom sql commands to the end of the file.
    else
    	echo "CREATE DATABASE IF NOT EXISTS \`wordpress_themereview\`;" >> /srv/database/init-custom.sql
    	echo "GRANT ALL PRIVILEGES ON \`wordpress_themereview\`.* TO 'wp'@'localhost' IDENTIFIED BY 'wp';" >> /srv/database/init-custom.sql
    	echo " * Custom sql commands were succesfully added."
    fi
fi
#!/bin/bash

sleep 10

if [ ! -f /var/www/html/wp-config.php ]; then
	mkdir -p /var/www/html

	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar;
	chmod +x wp-cli.phar; 
	mv wp-cli.phar /usr/local/bin/wp;

	cd /var/www/html;

	wp core download --allow-root;
	
	mv wp-config-sample.php wp-config.php
	sed -i "s/database_name_here/${MYSQL_NAME}/" wp-config.php;
	sed -i "s/username_here/${MYSQL_LOGIN}/" wp-config.php;
	sed -i "s/password_here/${MYSQL_PASSWORD}/" wp-config.php;
	sed -i "s/localhost/${MYSQL_DATABASE}/" wp-config.php;

	wp core install --allow-root \
		--url=${WP_URL} \
		--title=${WP_TITLE} \
		--admin_user=${WP_ADMIN_LOGIN} \
		--admin_password=${WP_ADMIN_PASSWORD} \
		--admin_email=${WP_ADMIN_EMAIL}

	wp user create --allow-root ${WP_USER_LOGIN} ${WP_USER_EMAIL} --user_pass=${WP_USER_PASSWORD};
fi

exec "$@"
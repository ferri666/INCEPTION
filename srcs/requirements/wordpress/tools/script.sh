#!/bin/sh

if [ -f ./wp-config.php ]
then
	echo "Wordpress already installed."
else
	wp core download --allow-root;

	wp config create --dbname=$db_name --dbuser=$db_user --dbpass=$db_pwd --dbhost=mariadb --allow-root;

	wp core install --url=ffons-ti.42.fr --title=$WP_TITLE --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --allow-root;

	wp user create $WP_USR $WP_EMAIL --role=author --user_pass=$WP_PWD --allow-root;

	wp plugin update --all --allow-root
fi

echo "Starting Wordpress ✅"
/usr/sbin/php-fpm7.4 --nodaemonize

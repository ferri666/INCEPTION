#!/bin/bash
cd /var/www/html

./wp-cli.phar core download --allow-root

mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php
mv /wp-config.php /var/www/html/wp-config.php

sed -i -r "s/db1/$db_name/1"   wp-config.php
sed -i -r "s/user/$db_user/1"  wp-config.php
sed -i -r "s/pwd/$db_pwd/1"    wp-config.php

./wp-cli.phar config create --dbname=wordpress --dbuser=$db_user --dbpass=$db_pwd --dbhost=mariadb --allow-root
./wp-cli.phar core install --url=$DOMAIN_NAME/ --title=$WP_TITLE --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --allow-root
./wp-cli.phar user create $WP_USR $WP_EMAIL --role=author --user_pass=$WP_PWD --alow-root
./wp-cli.phar theme install astra --activate --allow-root
./wp-cli.phar plugin update --all --allow-root

mkdir /run/php

php-fpm7.4 -F

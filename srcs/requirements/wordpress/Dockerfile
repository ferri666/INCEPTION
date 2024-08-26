FROM debian:bullseye

RUN apt update -y 

RUN apt upgrade -y

RUN apt install php-fpm -y

RUN apt install php-mysqli -y

RUN apt install curl -y \
	mariadb-client \
	php7.4-common 

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar --silent
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

RUN mkdir -p /var/www/html \
	&& chown -R www-data:www-data /var/www/html

RUN chmod -R 755 /var/www/html

COPY tools/www.conf /etc/php/7.4/fpm/pool.d/.

COPY tools/script.sh /var/www/script.sh

RUN mkdir -p /run/php

RUN chmod +x /var/www/script.sh

WORKDIR /var/www/html

CMD ["/var/www/script.sh"]

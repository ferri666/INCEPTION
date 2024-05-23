FROM debian:bullseye

RUN apt update -y 

RUN apt upgrade -y

RUN apt install php-fpm -y

RUN apt install php-mysqli -y

RUN apt install curl -y

COPY tools/www.conf /etc/php/7.4/fpm/pool.d/.

COPY tools/script.sh .

COPY tools/wp-config.php /
RUN chmod +x script.sh
CMD ["./script.sh"]

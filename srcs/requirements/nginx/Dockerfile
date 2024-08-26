FROM debian:bullseye


RUN apt update -y && apt install -y nginx && apt install openssl -y

COPY tools/default /etc/nginx/sites-available/.

RUN mkdir /etc/nginx/ssl

COPY tools/script.sh .

RUN chmod +x script.sh

CMD ["./script.sh"]

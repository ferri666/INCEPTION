#!/bin/bash

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=ES/ST=Madrid/L=Madrid/O=42/OU=student/CN=ffons-ti.42.fr"

nginx -g "daemon off;"

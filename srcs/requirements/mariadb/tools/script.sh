#!/bin/bash

MYSQL_INIT_FILE="/createdb.sql"

chown -R mysql: /var/lib/mysql
chmod 777 /var/lib/mysql

mysql_install_db >/dev/null 2>&1

if [ ! -d "/var/lib/mysql/$db1_name" ]; then
	rm -f "$MYSQL_INIT_FILE"
	echo "CREATE DATABASE $db1_name;" >> "$MYSQL_INIT_FILE"
	echo "CREATE USER '$db1_user'@'%' IDENTIFIED BY '$db1_pwd';" >> "$MYSQL_INIT_FILE"
	echo "GRANT ALL PRIVILEGES ON $db1_name.* TO '$db1_user'@'%';" >> "$MYSQL_INIT_FILE"
	echo "ALTER USER 'root'@'%' IDENTIFIED BY '$root_pwd';" >> "$MYSQL_INIT_FILE"
	echo "FLUSH PRIVILEGES;" >> "$MYSQL_INIT_FILE"
	echo "Starting database ✅"
	mysqld_safe --init-file=$MYSQL_INIT_FILE >/dev/null 2>&1
else
	echo "Starting database ✅"
	mysqld_safe >/dev/null 2>&1
fi


#!/bin/bash

mysql_install_db

rm /etc/mysql/init.sql

echo "CREATE DATABASE IF NOT EXISTS $db1_name ;" > init.sql
echo "CREATE USER IF NOT EXISTS '$db1_user'@'%' IDENTIFIED BY '$db1_pwd' ;" >> init.sql
echo "GRANT ALL PRIVILEGES ON $db1_name.* TO '$db1_user'@'%' ;" >> init.sql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '12345' ;" >> init.sql
echo "FLUSH PRIVILEGES;" >> init.sql

chmod +x init.sql
mv init.sql /etc/mysql/init.sql

mysqld

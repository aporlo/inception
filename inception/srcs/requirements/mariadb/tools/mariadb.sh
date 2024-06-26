#!/bin/bash

service mariadb start

if [ ! -d "/var/lib/mysql/wordpress_db" ]
then
    # Secure Databases
    echo -e "\ny\ny\n${DB_ROOT}\n${DB_ROOT}\ny\ny\ny\ny\n" | mysql_secure_installation

    # Init Databases
    mariadb -e "CREATE DATABASE IF NOT EXISTS \`${DB_NAME}\`;"
    mariadb -e "CREATE USER IF NOT EXISTS \`${DB_USER}\`@'%' IDENTIFIED BY '${DB_PASSWORD}';"
    mariadb -e "GRANT ALL PRIVILEGES ON \`${DB_NAME}\`.* TO \`${DB_USER}\`@'%' IDENTIFIED BY '${DB_PASSWORD}';"
    mariadb -e "FLUSH PRIVILEGES;"
fi

service mariadb stop

chmod 777 -R /var/lib/mysql/

exec "$@"

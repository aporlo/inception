FROM    debian:bullseye
#set system
RUN     apt update && apt upgrade -y

#set mariadb
RUN     apt-get install mariadb-server -y
COPY    ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY    ./tools/mariadb.sh /home/

RUN     chmod +x /home/mariadb.sh
RUN     mkdir -p /var/run/mysqld && \
        chmod -R 777 /var/run/mysqld
ENTRYPOINT     ["/home/mariadb.sh"]


CMD	["mysqld"]
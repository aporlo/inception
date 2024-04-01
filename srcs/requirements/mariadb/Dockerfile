FROM    debian:bullseye
#set system
RUN     apt update && apt upgrade

#set mariadb
RUN     apt-get install mariadb-server -y
COPY    ./tools/mariadb.sh /home/

RUN     chmod +x /home/mariadb.sh
ENTRYPOINT     [./home/mariadb.sh]


CMD	   ["mysqld"]

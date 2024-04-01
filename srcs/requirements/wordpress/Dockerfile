FROM    debian:bullseye
RUN     apt update && apt upgrade

#set wordpresss
RUN     apt-get install php php-mysql php-fpm mariadb-client wget -y
RUN     wget -O /tmp/wordpress.tar.gz https://wordpress.org/latest.tar.gz
RUN     mkdir -p /var/www/html/wordpress && tar -xzvf /tmp/wordpress.tar.gz -C /var/www/html 
RUN     chown -R www-data:www-data /var/www/html/wordpress 
RUN     chmod -R 755 /var/www/html/wordpress
COPY	./tools/wordpress.sh /home/
COPY    ./conf/www.conf /etc/php/7.4/fpm/pool.d/

RUN		wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar\
		&& chmod +x wp-cli.phar\
		&& mv wp-cli.phar /usr/local/bin/wp
RUN     chmod +x /home/wordpress.sh

ENTRYPOINT [./home/wordpress.sh]

CMD	[ "/usr/sbin/php-fpm7.4", "-F" ]
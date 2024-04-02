FROM	debian:bullseye

RUN	apt update && apt install vim -y

# php
RUN	apt install php php-mysql php-fpm mariadb-client -y

# wordpress
RUN	apt install wget -y
RUN	wget -O /tmp/wordpress.tar.gz https://wordpress.org/latest.tar.gz && \ 
	mkdir -p /var/www/html/wordpress && \
	tar -xzvf /tmp/wordpress.tar.gz -C /var/www/html && \
	chown -R www-data.www-data /var/www/html/wordpress && \
	chmod -R 775 /var/www/html/wordpress

#install wp-cli
RUN	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp && \	
    	chmod +x /usr/local/bin/wp
COPY	./tools/wordpress.sh /home/
COPY    ./conf/www.conf /etc/php/7.4/fpm/pool.d/
RUN	chmod +x /home/wordpress.sh
RUN	service php7.4-fpm start

ENTRYPOINT [ "/home/wordpress.sh" ]

CMD	[ "/usr/sbin/php-fpm7.4", "-F" ]

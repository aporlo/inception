FROM    debian:bullseye
RUN     apt update && apt upgrade -y && apt install nginx -y
COPY    ./conf/myconf.conf /etc/nginx/conf.d/ 

RUN rm /etc/nginx/sites-enabled/default && rm /etc/nginx/sites-available/default

# COPY
CMD	[ "nginx", "-g", "daemon off;" ]
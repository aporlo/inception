FROM    debian:bullseye
RUN     apt update && apt upgrade -y && apt install nginx -y
COPY    ./conf/myconf.conf /etc/nginx/conf.d/ 

# COPY
CMD	[ "nginx", "-g", "daemon off;" ]
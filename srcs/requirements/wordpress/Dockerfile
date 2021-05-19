FROM debian:buster

LABEL maintainer="wluong"

#UPDATING

RUN		apt-get update
RUN		apt-get upgrade -y
RUN		apt-get install openssl -y
RUN		apt-get install wget -y
RUN		apt-get install php7.3-fpm -y

#WORDPRESS

RUN	wget	https://wordpress.org/latest.tar.gz
RUN	tar		-xvf latest.tar.gz
RUN	mv		wordpress/ /var/www/html
RUN	rm		latest.tar.gz

RUN chown -R www-data:www-data /var/www/*
RUN chmod -R 755 /var/www/*

#START
COPY	./tools/run.sh ./
CMD		bash run.sh

EXPOSE 9000
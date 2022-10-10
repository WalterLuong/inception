FROM debian:buster

LABEL	maintainer="wluong@student.42.fr"

RUN apt update && \
    apt upgrade -y && \
    apt autoremove && \
    apt install -y wget \
        mariadb-client \
        php7.3-fpm \
	php7.3-mysqli \
	php7.3-mbstring \
	php7.3-pdo \
        php-curl \
        php-gd \
        php-mbstring \
        php-xml \
        php-xmlrpc \
        php-soap \
        php-intl \
        php-zip

RUN     wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \ 
        php wp-cli.phar --info && chmod +x wp-cli.phar && \
        mv wp-cli.phar /usr/bin/wp && \
        chmod 755 /usr/bin/wp && \
        mkdir -p /run/php && \
        mkdir -p /var/log/php-fpm /var/www/html

RUN     wp --path=/var/www/html --allow-root core download

RUN adduser \
   --system \
   --shell /bin/bash \
   --gecos "nginx" \
   --group \
   --disabled-password \
   nginx

RUN chown -R nginx:nginx /var/www/

RUN service php7.3-fpm start

COPY    ./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

COPY ./tools/entrypoint.sh /run/php

RUN chmod 777 run/php/entrypoint.sh

EXPOSE 9000

ENTRYPOINT [ "bash", "/run/php/entrypoint.sh" ]

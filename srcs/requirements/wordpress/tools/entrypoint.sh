#!/bin/bash

NOR="\033[m"
RED="\033[1;3;31m"
GREEN="\033[1;3;32m"

sleep 10

wp --path=${WP_PATH} --allow-root core is-installed
if [ $? -ne 0 ]
then
    echo -e "${RED}Wordpress is not installed yet. let's install it ...${NOR}"
    wp config create --path=${WP_PATH} --dbname=${MYSQL_DATABASE} --dbuser=${MYSQL_USER} --dbpass=${MYSQL_PASSWORD} --dbhost=${DB_HOST} --dbcharset="utf8" --dbcollate="utf8_general_ci" --allow-root

    wp --allow-root core install --path=${WP_PATH} --url=${MY_URL} --title="${TITLE}" --admin_user=${MYSQL_USER} --admin_password=${MYSQL_PASSWORD} --admin_email=wluong@student.42.fr
    wp --path=$WP_PATH --allow-root user create mlormois mlormois@student.42.fr --role=author --user_pass=mlormois
   
    wp --path=$WP_PATH --allow-root user create ogenser ogenser@student.42.fr --role=author --user_pass=ogenser
    echo -e "${GREEN}Wordpress is installed !${NOR}"

else
    echo -e "${GREEN}Wordpress is already installed !${NOR}"

fi

php-fpm7.3 -F
FROM debian:buster

LABEL maintainer="wluong"

# UPDATING AND TOOLS

RUN		apt-get update
RUN		apt-get upgrade -y
RUN		apt-get install openssl -y
RUN		apt-get install wget -y

#NGINX

RUN apt-get install nginx -y

EXPOSE 80 443
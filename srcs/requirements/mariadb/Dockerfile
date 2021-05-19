FROM debian:buster

LABEL maintainer="wluong"

#UPDATING

RUN 	apt-get update
RUN 	apt-get upgrade -y
RUN 	apt-get install openssl -y
RUN		apt-get install wget -y


#MYSQL

RUN 	apt-get install -y mariadb-server

#START

COPY	./tools/run.sh ./
CMD		bash run.sh

EXPOSE 3306
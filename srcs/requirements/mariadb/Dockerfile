FROM alpine:3.13

LABEL maintainer="wluong"

RUN apk update && \
    apk -U  upgrade && \
    apk add mariadb mariadb-client

RUN rm -rf /var/lib/mysql && \
    mkdir -p /run/mysqld /var/lib/mysql && \
    chown -R mysql:mysql /run/mysqld/ /var/lib/mysql/ && \
    chmod 777 /run/mysqld  /var/lib/mysql

COPY ./conf/mariadb-server.cnf /etc/mysql/my.cnf
RUN chown -R mysql:mysql /etc/mysql

COPY ./tools/run.sh /home/script/run.sh

RUN chmod 777 /home/script/run.sh

EXPOSE 3306

ENTRYPOINT [ "sh", "/home/script/run.sh" ]
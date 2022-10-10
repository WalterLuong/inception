FROM alpine:3.13

LABEL maintainer="wluong"

RUN apk -U upgrade && \
    apk update && \
    apk add openssl nginx && \
    mkdir -p /run/nginx/

RUN  openssl req -newkey rsa:4096 -days 365 -nodes -x509 -subj "/C=FR/ST=75/L=Paris/O=42Paris/OU=wluong/CN=localhost" -keyout localhost.dev.key -out localhost.dev.crt && \
    mkdir -p etc/ssl/certs/ && \
    mkdir -p etc/ssl/private/ && \
    mv localhost.dev.crt /etc/ssl/certs/ && \
    mv localhost.dev.key /etc/ssl/private/ && \
    chmod 600 /etc/ssl/certs/localhost.dev.crt && \
    chmod 600 /etc/ssl/private/localhost.dev.key

COPY ./conf/default.conf /etc/nginx/http.d/default.conf

EXPOSE 443

ENTRYPOINT ["nginx", "-g", "daemon off;"]


# FROM debian:buster


# RUN apt-get update && apt-get install -y nginx vim openssl && \
#     openssl req -newkey rsa:4096 -days 365 -nodes -x509 -subj "/C=FR/ST=75/L=Paris/O=42Paris/OU=wluong/CN=localhost" -keyout localhost.dev.key -out localhost.dev.crt && \
#     mkdir -p etc/ssl/certs/ && \
#     mkdir -p etc/ssl/private/ && \
#     mv localhost.dev.crt etc/ssl/certs/ && \
#     mv localhost.dev.key etc/ssl/private/ && \
#     chmod 600 /etc/ssl/certs/localhost.dev.crt && \
#     chmod 600 /etc/ssl/private/localhost.dev.key && \
#     mkdir -p /run/nginx/
# # RUN adduser --disabled-password --shell /bin/bash "nginx" nginx --gecos
#     # chown nginx:nginx /run/nginx -R

# COPY ./conf/default.conf /etc/nginx/sites-available/default


# EXPOSE 443

# ENTRYPOINT ["nginx", "-g", "daemon off;"]
# # CMD chown www-data:www-data /var/www -R && chmod -R 755 /var/www

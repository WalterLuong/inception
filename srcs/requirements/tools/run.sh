#!/bin/bash

echo "\033[0;35m███╗   ██╗ ██████╗ ██╗███╗   ██╗██╗  ██╗"
echo "████╗  ██║██╔════╝ ██║████╗  ██║╚██╗██╔╝"
echo "██╔██╗ ██║██║  ███╗██║██╔██╗ ██║ ╚███╔╝ "
echo "██║╚██╗██║██║   ██║██║██║╚██╗██║ ██╔██╗ "
echo "██║ ╚████║╚██████╔╝██║██║ ╚████║██╔╝ ██╗"
echo "╚═╝  ╚═══╝ ╚═════╝ ╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝\033[0m"

chmod 755 /run.sh

#SSL KEY AND CERTIFICATE

openssl req -newkey rsa:4096 -days 365 -nodes -x509 -subj "/C=FR/ST=75/L=Paris/O=42Paris/OU=wluong/CN=localhost" -keyout localhost.dev.key -out localhost.dev.crt
mv localhost.dev.crt etc/ssl/certs/
mv localhost.dev.key etc/ssl/private/
chmod 600 /etc/ssl/certs/localhost.dev.crt
chmod 600 /etc/ssl/private/localhost.dev.key

#START NGINX
service nginx start

nginx -g "daemon off;"
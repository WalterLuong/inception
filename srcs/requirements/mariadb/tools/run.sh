#!/bin/bash


if [ ! -f ${MYSQL_PATH}/mysql_initialized ]; then

    printf "\033[1;3;32mInitialisation de la database...\n\033[m"
    mysql_install_db --user=mysql --datadir=${MYSQL_PATH} --basedir=/usr --rpm > /dev/null

    printf "\033[1;3;32mStarting mysqld in background...\n\033[m"

    mysqld_safe &

    sleep 2

    printf "\033[1;3;31mCreating our database by deleting the test database...\n\033[m"

    cat > tmpfile << EOF
USE mysql;
FLUSH PRIVILEGES;
DELETE FROM mysql.user WHERE User='';
DROP DATABASE IF EXISTS test;
DELETE FROM mysql.db WHERE Db='test';
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
ALTER USER 'root'@'localhost' IDENTIFIED BY '${ROOT_PASSWORD}';
CREATE DATABASE ${MYSQL_DATABASE};
CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
GRANT ALL PRIVILEGES ON *.* TO '${MYSQL_USER}'@'%';
FLUSH PRIVILEGES;
EOF
    mysql -u root -p$ROOT_PASSWORD < tmpfile

    sleep 2

    printf "\033[1;3;32mDatabase created !\n\033[m"
    
    printf "\033[1;3;31mKill mysqld running...\n\033[m"

    mysqladmin -u root -p"$ROOT_PASSWORD" shutdown

    printf "\033[1;3;32mMysqld killed !\n\033[m"
    
    touch ${MYSQL_PATH}/mysql_initialized

    rm -f tmpfile

fi

sleep 1

printf "\033[1;3;31mRestart mysqld...\n\033[m"

exec /usr/bin/mysqld --user=root
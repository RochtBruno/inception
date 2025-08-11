#!/bin/bash
set -e

# Inicia o serviço MariaDB temporariamente
service mariadb start

# Cria banco e usuário usando variáveis do .env
mysql -u root -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};"
mysql -u root -e "DROP USER IF EXISTS '${MYSQL_USER}'@'localhost';"
mysql -u root -e "DROP USER IF EXISTS '${MYSQL_USER}'@'%';"
mysql -u root -e "CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mysql -u root -e "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%';"
mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"
mysql -u root -e "FLUSH PRIVILEGES;"

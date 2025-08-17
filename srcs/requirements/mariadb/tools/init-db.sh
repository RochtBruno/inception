#!/bin/bash
# set -e

# # Inicializa o MariaDB temporariamente em background
# mysqld_safe --skip-networking &
# pid="$!"

# # Espera o MariaDB estar pronto
# until mysqladmin ping --silent; do
#     echo "Aguardando o MariaDB iniciar..."
#     sleep 2
# done

touch init.sql

cat << EOF >> init.sql
CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};
DROP USER IF EXISTS '${MYSQL_USER}'@'%';
CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%';
ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';
FLUSH PRIVILEGES;
EOF

mv init.sql /etc/mysql

exec mysqld_safe 

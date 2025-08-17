#!/bin/bash
set -e

# Verifica se variáveis essenciais estão setadas
: "${MYSQL_HOST:?MYSQL_HOST não definido}"
: "${MYSQL_USER:?MYSQL_USER não definido}"
: "${MYSQL_PASSWORD:?MYSQL_PASSWORD não definido}"
: "${MYSQL_DATABASE:?MYSQL_DATABASE não definido}"

# Aguarda o MariaDB estar pronto (timeout de 60s)
echo "Aguardando o MariaDB iniciar em ${MYSQL_HOST}..."
for i in {1..20}; do
    if mysql -h"${MYSQL_HOST}" -u"${MYSQL_USER}" -p"${MYSQL_PASSWORD}" -e "SELECT 1;" &> /dev/null; then
        echo "MariaDB está pronto!"
        break
    fi
    echo "Tentativa $i: MariaDB ainda não está pronto..."
    sleep 3
    if [ "$i" -eq 20 ]; then
        echo "ERRO: Timeout ao conectar ao MariaDB."
        exit 1
    fi
done

# Baixa WordPress se não existir
if [ ! -f wp-config.php ]; then
    echo "Instalando WordPress..."
    wp core download --allow-root

    wp config create \
        --dbname="${MYSQL_DATABASE}" \
        --dbuser="${MYSQL_USER}" \
        --dbpass="${MYSQL_PASSWORD}" \
        --dbhost="${MYSQL_HOST}" \
        --allow-root

    wp core install \
        --url="${DOMAIN_NAME}" \
        --title="${WP_TITLE}" \
        --admin_user="${WP_ADMIN_USER}" \
        --admin_password="${WP_ADMIN_PASSWORD}" \
        --admin_email="${WP_ADMIN_EMAIL}" \
        --skip-email \
        --allow-root

    wp user create "${WP_USER}" "${WP_USER_EMAIL}" \
        --user_pass="${WP_USER_PASSWORD}" \
        --allow-root

    wp theme install twentytwentyfour --activate --allow-root
fi

exec "$@"
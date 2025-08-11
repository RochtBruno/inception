FROM debian:bullseye

# Instala dependências
RUN apt-get update && apt-get install -y \
    php-fpm php-mysql php-cli php-mbstring php-xml php-curl php-zip wget curl mariadb-client \
    && rm -rf /var/lib/apt/lists/*

# Instala WP-CLI
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

# Copia script de configuração do WordPress
COPY tools/setup-wordpress.sh /usr/local/bin/setup-wordpress.sh
RUN chmod +x /usr/local/bin/setup-wordpress.sh

# Cria diretório para o WordPress
RUN mkdir -p /var/www/html && chown -R www-data:www-data /var/www/html

WORKDIR /var/www/html

# Expõe a porta do PHP-FPM
EXPOSE 9000

# Comando padrão
CMD ["php-fpm7.4", "-F"]

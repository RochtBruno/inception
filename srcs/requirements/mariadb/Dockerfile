FROM debian:bullseye

# Atualiza pacotes e instala MariaDB
RUN apt-get update && apt-get install -y mariadb-server && rm -rf /var/lib/apt/lists/*

# Copia configuração personalizada do MariaDB
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/

# Copia script de inicialização
COPY tools/init-db.sh /docker-entrypoint-initdb.d/

# Dá permissão ao script
RUN chmod +x /docker-entrypoint-initdb.d/init-db.sh

# Expõe porta do MySQL
EXPOSE 3306

# Comando padrão do container
ENTRYPOINT ["/docker-entrypoint-initdb.d/init-db.sh"]


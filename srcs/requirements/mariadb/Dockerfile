FROM debian:bullseye

RUN apt-get update && apt-get install -y mariadb-server

# On expose le port par défaut de MySQL/MariaDB
EXPOSE 3306

# On copie notre script de configuration et le fichier de conf
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY tools/setup.sh /usr/local/bin/setup.sh

RUN chmod +x /usr/local/bin/setup.sh

# Le script va créer la database et l'utilisateur avant de lancer le serveur
ENTRYPOINT ["/usr/local/bin/setup.sh"]
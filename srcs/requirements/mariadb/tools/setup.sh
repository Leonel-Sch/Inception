#!/bin/bash

# S'assurer que le dossier de database appartient à l'utilisateur mysql
chown -R mysql:mysql /var/lib/mysql

# Initialisation si le dossier est vide
if [ ! -d "/var/lib/mysql/mysql" ]; then
    mysql_install_db --user=mysql --datadir=/var/lib/mysql
fi

# Création du script d'init
echo "CREATE DATABASE IF NOT EXISTS $SQL_DATABASE;
ALTER USER 'root'@'localhost' IDENTIFIED BY '$SQL_ROOT_PASSWORD';
GRANT ALL PRIVILEGES ON $SQL_DATABASE.* TO '$SQL_USER'@'%' IDENTIFIED BY '$SQL_PASSWORD';
FLUSH PRIVILEGES;" > /tmp/init.sql

# Lancement propre
echo "MariaDB starting..."
exec mysqld_safe --bind-address=0.0.0.0 --init-file=/tmp/init.sql


# #!/bin/bash

# # Initialisation du dossier de données si vide
# if [ ! -d "/var/lib/mysql/mysql" ]; then
#     mysql_install_db --user=mysql --datadir=/var/lib/mysql
# fi

# # Création d'un fichier temporaire de configuration SQL
# tfile=`mktemp`
# if [ ! -f "$tfile" ]; then
#     return 1
# fi

# cat << EOF > $tfile
# USE mysql;
# FLUSH PRIVILEGES;
# DELETE FROM mysql.user WHERE User='';
# DROP DATABASE IF EXISTS test;
# DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';
# ALTER USER 'root'@'localhost' IDENTIFIED BY '$SQL_ROOT_PASSWORD';
# CREATE DATABASE IF NOT EXISTS $SQL_DATABASE;
# CREATE USER IF NOT EXISTS '$SQL_USER'@'%' IDENTIFIED BY '$SQL_PASSWORD';
# GRANT ALL PRIVILEGES ON $SQL_DATABASE.* TO '$SQL_USER'@'%';
# FLUSH PRIVILEGES;
# EOF

# # Lancement de MariaDB avec le fichier d'initialisation
# exec mysqld_safe --init-file=$tfile


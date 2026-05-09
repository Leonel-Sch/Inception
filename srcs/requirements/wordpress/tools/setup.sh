#!/bin/bash

# Attendre que MariaDB soit accessible sur le réseau
while ! mariadb-admin ping -h"mariadb" --silent; do
    echo "Waiting for MariaDB..."
    sleep 2
done

# On se place dans le bon dossier
cd /var/www/wordpress

# 1. Téléchargement seulement si vide
if [ ! -f "wp-config.php" ]; then
    wp core download --allow-root

    # 2. Création de la config
    wp config create --allow-root \
        --dbname=$SQL_DATABASE \
        --dbuser=$SQL_USER \
        --dbpass=$SQL_PASSWORD \
        --dbhost=mariadb:3306

    # 3. Installation du site
    wp core install --allow-root \
        --url=$WP_URL \
        --title=$WP_TITLE \
        --admin_user=$WP_ADMIN_USER \
        --admin_password=$WP_ADMIN_PASSWORD \
        --admin_email=$WP_ADMIN_EMAIL

    # 4. Création du second user
    wp user create --allow-root $WP_AUTHOR_USER $WP_AUTHOR_EMAIL --role=author --user_pass=$WP_AUTHOR_PASSWORD
fi

echo "WordPress started on port 9000"
exec /usr/sbin/php-fpm7.4 -F
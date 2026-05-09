FROM debian:bullseye

RUN apt-get update && apt-get install -y \
    wget \
    php7.4 \
    php-fpm \
    php-mysql \
    mariadb-client

# On télécharge l'outil CLI de WordPress (indispensable pour l'auto-config)
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

# Configuration de PHP-FPM pour qu'il écoute sur le port 9000
RUN mkdir -p /run/php
COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

# Script d'installation automatique
COPY tools/setup.sh /usr/local/bin/setup.sh
RUN chmod +x /usr/local/bin/setup.sh

WORKDIR /var/www/wordpress

ENTRYPOINT ["/usr/local/bin/setup.sh"]
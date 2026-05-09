# Utilisation de Debian Bullseye (stable et légère)
FROM debian:bullseye

# Installation de NGINX et OpenSSL
RUN apt-get update && apt-get install -y nginx openssl

# Création du dossier pour les certificats SSL
RUN mkdir -p /etc/nginx/ssl

# Génération du certificat auto-signé (SSL/TLS)
# C'est ce qui permet d'avoir le "https"
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -out /etc/nginx/ssl/inception.crt \
    -keyout /etc/nginx/ssl/inception.key \
    -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=lscheupl.42.fr/UID=lscheupl"

# Copie de notre fichier de configuration personnalisé
COPY conf/nginx.conf /etc/nginx/conf.d/default.conf

# NGINX tourne sur le port 443 pour le HTTPS
EXPOSE 443

# Lancement de NGINX au premier plan (crucial pour Docker)
CMD ["nginx", "-g", "daemon off;"]
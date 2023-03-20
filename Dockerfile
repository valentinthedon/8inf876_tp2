# La Base de notre conteneur, ici nous utiliserons la dernière
# version de Debian pour y créer notre environement
FROM debian:latest


# A ce stade, nous avons uniquement un conteneur avec une base Debian
# Nous allons donc exécuter les commandes bash permettant une
# installation de nginx, application de service web très réputés
RUN apt -y update && \           
    apt -y upgrade && \         
    apt -y install nginx && \
    mkdir -p /var/www/html


# Ensuite, une fois les commandes installant le service nginx terminées
# nous copions notre page web ainsi que les fichier de configuration
# du serveur nginx
COPY ./index.html /var/www/html
COPY nginx.conf /etc/nginx/nginx.conf
COPY test.conf /etc/nginx/conf.d/test.conf


# Nous voulons évidemment accéder à notre page web, pour cela nous
# exposons le port 80 (pour la réception de requête HTTP). Nous
# aurions pu également exposer le port 443 pour mettre en place
# le HTTPS
EXPOSE 80


# L'entrypoint permet de définir la commande à executer par défaut
# par le conteneur à son lancement
# Ici nous ajoutons à la commande nginx une option (-g daemon off;)
# afin de lancer le conteneur en premier plan ce qui permet d'eviter
# l'arret du conteneur à la fin de la
ENTRYPOINT [ "nginx", "-g", "daemon off;"]
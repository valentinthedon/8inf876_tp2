FROM debian:latest

RUN apt -y update && \
    apt -y upgrade && \
    apt -y install nginx && \
    mkdir -p /var/www/html

COPY ./index.html /var/www/html
COPY nginx.conf /etc/nginx/nginx.conf
COPY test.conf /etc/nginx/conf.d/test.conf

EXPOSE 80

ENTRYPOINT [ "nginx", "-g", "daemon off;"]
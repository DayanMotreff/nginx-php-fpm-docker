FROM nginx

RUN apt update && apt install -y php-fpm php-common php-mysql php-cgi php-mbstring php-curl php-gd php-xml php-xmlrpc php-pear

RUN mkdir /etc/nginx/cert

COPY ./cert/* /etc/nginx/cert/
COPY ./default.conf /etc/nginx/conf.d/default.conf
COPY ./index.php /usr/share/nginx/html

RUN rm /usr/share/nginx/html/index.html

COPY startphpfpm.sh /docker-entrypoint.d/
COPY nginx.conf /etc/nginx/nginx.conf
RUN usermod -aG www-data nginx

EXPOSE 443


FROM debian:buster

#installation des logiciels
RUN apt-get update
RUN apt-get -y install php7.3 php-mysqli php-fpm wget 

#le container ecoute sur le port 9000
EXPOSE 9000

#copy des fichiers necessaire a l'installation
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d
COPY ./conf/wp-config.php /var/www/wp-config.php
COPY ./conf/wp_script.sh /var/www/wp_script.sh

RUN chmod +x /var/www/wp_script.sh

RUN sed -i "s/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/" "/etc/php/7.3/fpm/pool.d/www.conf";

#donne les droit au fichier
RUN chown -R www-data:www-data /var/www/*

RUN chown -R 755 /var/www/*

RUN mkdir -p /run/php/

#surveille et controle le processus PHP-FPM
RUN touch /run/php/php7.3-fpm.pid

ENTRYPOINT [ "/var/www/wp_script.sh" ]

CMD ["/usr/sbin/php-fpm7.3", "--nodaemonize"]
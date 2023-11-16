FROM debian:buster

RUN apt-get update && apt-get install -y mariadb-server

COPY ./conf/mariadb.sh /var/www/mariadb.sh

RUN chmod 755 /var/www/mariadb.sh

ENTRYPOINT ["/var/www/mariadb.sh"]

EXPOSE 3306

CMD ["mysqld","--bind-address=0.0.0.0"]
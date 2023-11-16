FROM debian:buster

RUN apt-get update

RUN apt-get install -y nginx openssl 

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

#-x509 : certificat auto-signe
#-nodes : cle privee du certificat sera generee sans phrase secrete
RUN openssl req -x509 -nodes -days 365 -newkey rsa:4096 -keyout /etc/ssl/private/nginx.key -out /etc/ssl/certs/nginx.crt -subj "/C=FR/ST=Charante/L=angouleme/O=42/CN=alprival.42.fr";

#le container ecoute sur le port 443 
EXPOSE 443

CMD ["nginx","-g","daemon off;"]

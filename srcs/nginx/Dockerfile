FROM alpine:3.12.0

RUN apk update
RUN apk add nginx openssl openssh-server

COPY ./index.html /var/www/localhost/htdocs
COPY ./run.sh /tmp/
RUN chmod +x /tmp/run.sh

RUN mkdir -p /ssl/
RUN openssl req -x509 -nodes -newkey rsa:2048 -keyout /ssl/cert.key -out /ssl/cert.crt -days 365 -subj '/CN=localhost'

EXPOSE 80 443 22

ENTRYPOINT ["/tmp/run.sh"]

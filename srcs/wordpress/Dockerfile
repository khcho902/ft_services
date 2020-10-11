FROM alpine
RUN apk update && apk add \
		php7 php7-fpm php7-mbstring php7-session \
		php7-common php7-iconv php7-json php7-gd php7-curl php7-xml \
		php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql \
		php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap \
		php7-ctype php7-dom

RUN wget https://wordpress.org/latest.tar.gz \
		&& tar -zxvf latest.tar.gz \
		&& rm latest.tar.gz \
		&& mv wordpress /etc/

COPY wp-config.php /etc/wordpress/

EXPOSE 5050

CMD php -S 0.0.0.0:5050 -t /etc/wordpress/

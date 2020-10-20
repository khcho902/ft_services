FROM alpine
RUN apk update
#RUN apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli \
#	php7-zlib php7-curl php7-mbstring php7-json php7-session

RUN apk add nginx php7 php7-fpm php7-mbstring php7-session php7-common php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom
	
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-all-languages.tar.gz
RUN tar -xvf /phpMyAdmin-5.0.4-all-languages.tar.gz
RUN rm -f /phpMyAdmin-5.0.4-all-languages.tar.gz
RUN mv /phpMyAdmin-5.0.4-all-languages /var/www/localhost/htdocs/phpmyadmin
RUN rm -rf /var/cache/apk/*

COPY srcs/default.conf /etc/nginx/conf.d/

RUN mkdir -p /run/nginx
							
EXPOSE 5000

CMD php-fpm7 \
	&& nginx -g "daemon off;"

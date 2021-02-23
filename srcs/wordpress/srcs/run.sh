mysql -hmysql -Dwordpress -uroot -p$MYSQL_ROOT_PASSWORD < /tmp/wordpress.sql
php-fpm7 && nginx -g "daemon off;"

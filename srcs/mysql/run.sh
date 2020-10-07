#!/bin/sh

mkdir -p /run/mysqld
#chown -R mysql:mysql /var/run/mysqld

mysql_install_db --user=root

tfile=`mktemp`
cat > $tfile << EOF
USE mysql;
FLUSH PRIVILEGES;
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY "$MYSQL_ROOT_PASSWORD" WITH GRANT OPTION;
FLUSH PRIVILEGES;
EOF

mysqld --user=root --bootstrap < $tfile
rm -f $tfile

mysqld --user=root

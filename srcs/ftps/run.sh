#!/bin/sh

openssl req -newkey rsa:4096 -days 365 -nodes -x509 \
			-subj "/C=KR/ST=Seoul/L=Seoul/O=42Seoul/OU=Lee/CN=localhost" \
			-keyout /etc/ssl/private/vsftpd.key \
			-out /etc/ssl/certs/vsftpd.crt

mkdir -p /ftp
adduser -D -h /ftp ${FTP_USERNAME}
echo "${FTP_USERNAME}:${FTP_PASSWORD}" | chpasswd

vsftpd /etc/vsftpd/vsftpd.conf

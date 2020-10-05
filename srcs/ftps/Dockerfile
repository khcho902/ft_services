FROM alpine:3.12.0

RUN apk update && apk add \
		openssl \
		vsftpd

COPY ./run.sh /tmp/
RUN chmod +x /tmp/run.sh

EXPOSE 20 21 30000

ENTRYPOINT ["/tmp/run.sh"]

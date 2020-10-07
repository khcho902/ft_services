FROM alpine:3.12.0

RUN apk update && apk add \
		mysql \
		mysql-client

COPY run.sh /tmp/
RUN chmod +x /tmp/run.sh

EXPOSE 3306

ENTRYPOINT ["/tmp/run.sh"]

FROM alpine:3.12.0

RUN apk update && apk add \
		influxdb \
		telegraf \
		curl \
		jq \
		--repository http://dl-cdn.alpinelinux.org/alpine/v3.13/community/

COPY setup.sh /tmp/

EXPOSE 8086
ENTRYPOINT ["/tmp/setup.sh"]

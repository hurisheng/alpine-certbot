FROM alpine:latest

LABEL author="hurisheng"

# bash is for cloud service only, certbot dependencies missed py2-future
RUN apk add --no-cache bash certbot openssl ca-certificates tzdata \
  && echo "30 4 * * * certbot renew" >> /var/spool/cron/crontabs/root \
  && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
  && echo "Asia/Shanghai" > /etc/timezone \
  && apk --no-cache del tzdata

VOLUME [ "/etc/letsencrypt", "/opt/html" ]

CMD [ "crond", "-f" ]
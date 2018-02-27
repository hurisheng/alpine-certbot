FROM alpine:3.7

LABEL author="hurisheng"

# bash is for cloud service only, certbot dependencies missed py2-future
RUN apk add --no-cache bash certbot py2-future openssl \
  && echo "30 4 * * * certbot renew" >> /var/spool/cron/crontabs/root

VOLUME [ "/etc/letsencrypt", "/opt/html" ]

CMD [ "crond", "-f" ]
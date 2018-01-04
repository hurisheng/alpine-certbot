FROM alpine:3.7

LABEL author="hurisheng"

# bash is for cloud service only, certbot dependencies missed py2-future
RUN apk add --no-cache bash certbot py2-future

# setup certificates renewal cron job, weekly
COPY ./certbot_renewal /etc/periodic/daily/

VOLUME [ "/etc/letsencrypt", "/opt/html" ]

CMD [ "crond", "-f" ]
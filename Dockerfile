FROM alpine:latest

LABEL author="hurisheng"

# only openvpn package is required, bash is for cloud service only
RUN apk add --no-cache bash certbot openssl

# setup certificates renewal cron job, weekly
COPY ./certbot_renewal /etc/periodic/weekly/

VOLUME [ "/etc/letsencrypt" ]

CMD [ "crond", "-f" ]
FROM alpine:latest

LABEL author="hurisheng"

# only openvpn package is required, bash is for cloud service only
RUN apk update && apk add bash certbot

# setup certificates renewal cron job, weekly
COPY ./certbot_renewal /etc/periodic/weekly

VOLUME ["/etc/letsencrypt"]

CMD ["crond", "-f"]
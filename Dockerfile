FROM alpine:latest
ENV USER ""
ENV PSWD ""
ENV HOST ""
RUN addgroup -g 1000 nextcloud \
    && adduser -G nextcloud -D -u 1000 nextcloud \
    && apk update \
    && apk add nextcloud-client \
    && mkdir -p /home/nextcloud/data \
    && chown nextcloud:nextcloud /home/nextcloud/data
RUN crontab -l | { cat; echo "nextcloudcmd --non-interactive -u '$USER' -p '$PSWD' /home/nextcloud/data '$HOST'"; } | crontab -
CMD ["cron -f"]

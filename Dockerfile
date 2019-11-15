FROM alpine:latest
ADD files/supervisor.sh /supervisor.sh
ENV USER ""
ENV PSWD ""
ENV HOST ""
RUN addgroup -g 1000 nextcloud \
    && adduser -G nextcloud -D -u 1000 nextcloud \
    && apk update \
    && apk add nextcloud-client \
    && chmod +x /supervisor.sh \
    && mkdir -p /home/nextcloud/data \
    && chown nextcloud:nextcloud /home/nextcloud/data
CMD ["/supervisor.sh"]

FROM alpine:3.12
LABEL maintainer="mjy@z.mjyai.com"

ENV CFTOKEN= \
    CFZONE_NAME= \
    CFRECORD_NAME= \
    CFRECORD_TYPE=A

RUN apk update \
    && apk add curl bash \
    && rm -rf /var/cache/apk/*

COPY cf-v4-ddns.sh /root/cf-ddns.sh
RUN chmod +x /root/cf-ddns.sh

ENTRYPOINT crontab -l | { cat; echo "*/5 * * * * /root/cf-ddns.sh -k ${CFTOKEN} -h ${CFRECORD_NAME} -z ${CFZONE_NAME} -t ${CFRECORD_TYPE} >/dev/null 2>&1"; } | crontab - && crond -f -d 8
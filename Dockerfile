FROM alpine:3.19
LABEL maintainer="FFmpeg <ffmpeg-devel@ffmpeg.org>"

RUN apk update && \
    apk add --no-cache lighttpd perl perl-cgi perl-timedate && \
    rm -rf /var/cache/apk/*

RUN rm -rf /etc/lighttpd/* && \
    mkdir -p /var/www/fateweb

COPY www/ /var/www/localhost/htdocs/
COPY overlay/ /

ENTRYPOINT ["/usr/sbin/lighttpd", "-D", "-f", "/etc/lighttpd/lighttpd.conf"]
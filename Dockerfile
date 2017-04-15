#
# Dockerfile for shadowsocks-libev server mode
#

FROM lisnaz/shadowsocks-libev
MAINTAINER Vincent Gu <g@v-io.co>

ENV SS_SERVER_LISTEN_ADDR      0.0.0.0
ENV SS_SERVER_LISTEN_PORT      8388

# define service ports
EXPOSE $SS_SERVER_LISTEN_PORT/tcp
EXPOSE $SS_SERVER_LISTEN_PORT/udp

ADD entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]

# install dependencies
ENV SS_DEP bash
RUN set -ex \
    && apk add --update --no-cache $SS_DEP \
    && rm -rf /var/cache/apk/*

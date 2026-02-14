ARG VERSION=2026010800

FROM cgr.dev/chainguard/wolfi-base:latest

LABEL maintainer="Winnie The Pooh winsdominoes@winscloud.net"

ARG VERSION
ARG CONFIG_NATIVE=false
ARG VARIANT=default

WORKDIR /root/imessage-bridge
    
RUN apk -U upgrade \
    && apk --no-cache add git make \
    && rm -rf /var/cache/apk/* \
    && git clone https://github.com/lrhodin/imessage . \
    && make install

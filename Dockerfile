ARG VERSION=2026010800

FROM docker.io/library/debian:13

LABEL maintainer="Winnie The Pooh winsdominoes@winscloud.net"

ARG VERSION
ARG CONFIG_NATIVE=false
ARG VARIANT=default

WORKDIR /root/imessage-bridge
    
RUN apt update && apt upgrade \
    && apt install -y git make \
    && rm -rf /var/cache/apk/* \
    && git clone https://github.com/lrhodin/imessage . \
    && make install

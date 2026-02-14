ARG VERSION=2026010800

FROM docker.io/library/debian:13

LABEL maintainer="Winnie The Pooh winsdominoes@winscloud.net"

ARG VERSION
ARG CONFIG_NATIVE=false
ARG VARIANT=default

WORKDIR /root/imessage-bridge
    
RUN apt update -y && apt upgrade -y \
    && apt install -y git make sed \
    && git clone https://github.com/lrhodin/imessage . \
    && sed -i -e 's/sudo //g' scripts/bootstrap-linux.sh \
    && make build

COPY /root/imessage-bridge/data/mautrix-imessage-v2 /usr/bin/
RUN rm -rf /root/imessage-bridge

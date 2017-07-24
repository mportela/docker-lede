FROM ubuntu:xenial

MAINTAINER Acris Liu "acrisliu@gmail.com"

ENV LEDE_VERSION=v17.01.2

RUN set -ex \
    && apt update \
    && apt install --no-install-recommends --no-install-suggests -y subversion g++ zlib1g-dev build-essential git python rsync man-db libncurses5-dev gawk gettext unzip file libssl-dev wget \
    && rm -rf /var/lib/apt/lists/* \
    && useradd -m -s /bin/bash lede

USER lede
RUN set -ex \
    && cd /home/lede \
    && git clone https://git.lede-project.org/source.git lede \
    && cd lede \
    && git checkout $LEDE_VERSION \
    && git clone https://github.com/shadowsocks/openwrt-feeds.git package/feeds \
    && git clone https://github.com/shadowsocks/openwrt-shadowsocks.git package/shadowsocks-libev \
    && git clone https://github.com/shadowsocks/luci-app-shadowsocks.git package/luci-app-shadowsocks \
    && git clone https://github.com/aa65535/openwrt-chinadns.git package/chinadns \
    && git clone https://github.com/aa65535/openwrt-dns-forwarder.git package/dns-forwarder \
    && git clone https://github.com/aa65535/openwrt-simple-obfs.git package/simple-obfs \
    && git clone https://github.com/aa65535/openwrt-dist-luci.git package/openwrt-dist-luci \
    && ./scripts/feeds update -a \
    && ./scripts/feeds install -a

WORKDIR /home/lede/lede

COPY build-lede.sh /usr/local/bin/

CMD ["build-lede.sh"]

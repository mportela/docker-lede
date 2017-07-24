FROM ubuntu:xenial

MAINTAINER Acris Liu "acrisliu@gmail.com"

ENV LEDE_VERSION=v17.01.2
ENV SHADOWSOCKS_VERSION=v3.0.7
ENV LUCI_APP_SHADOWSOCKS_VERSION=v1.7.0
ENV CHINADNS_VERSION=v1.3.2-4
ENV DNS_FORWARDER_VERSION=v1.2.1
ENV SIMPLE_OBFS_VERSION=v0.0.3
ENV DIST_LUCI_VERSION=v1.6.1

COPY build-lede.sh /usr/local/bin/

RUN set -ex \
    && apt update \
    && apt install --no-install-recommends --no-install-suggests -y \
    build-essential subversion libncurses5-dev zlib1g-dev gawk gcc-multilib \
    flex git-core gettext libssl-dev openssl ca-certificates \
    && rm -rf /var/lib/apt/lists/* \
    && useradd -m -s /bin/bash lede

USER lede
RUN set -ex \
    && cd /home/lede \
    && git clone -b $LEDE_VERSION https://git.lede-project.org/source.git lede \
    && cd lede \
    && git clone https://github.com/shadowsocks/openwrt-feeds.git package/feeds \
    && git clone -b $SHADOWSOCKS_VERSION https://github.com/shadowsocks/openwrt-shadowsocks.git package/shadowsocks-libev \
    && git clone -b $LUCI_APP_SHADOWSOCKS_VERSION https://github.com/shadowsocks/luci-app-shadowsocks.git package/luci-app-shadowsocks \
    && git clone -b $CHINADNS_VERSION https://github.com/aa65535/openwrt-chinadns.git package/chinadns \
    && git clone -b $DNS_FORWARDER_VERSION https://github.com/aa65535/openwrt-dns-forwarder.git package/dns-forwarder \
    && git clone -b $SIMPLE_OBFS_VERSION https://github.com/aa65535/openwrt-simple-obfs.git package/simple-obfs \
    && git clone -b $DIST_LUCI_VERSION https://github.com/aa65535/openwrt-dist-luci.git package/openwrt-dist-luci \
    && ./scripts/feeds update -a \
    && ./scripts/feeds install -a

CMD ["/bin/bash"]

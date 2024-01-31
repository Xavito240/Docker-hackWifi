FROM kalilinux/kali-rolling

RUN apt-get update
RUN apt-get install -y \
    aircrack-ng \
    wireless-tools \
    iw\
    pciutils \
    net-tools \
   macchanger \
    procps \
    kmod \
    procps \
    iproute2 \
    ethtool \
    tcpdump \
    libnl-3-dev \
    libnl-genl-3-dev \
    libssl-dev

RUN mkdir -p /dev/net && mknod /dev/net/tun c 10 200 && chmod 666 /dev/net/tun

EXPOSE 12345

CMD ["bash"]

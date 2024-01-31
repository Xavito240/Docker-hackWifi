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

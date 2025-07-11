FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y --no-install-recommends \
    iputils-ping \
    telnet \
    curl \
    wget \
    net-tools \
    iproute2 \
    dnsutils \
    tcpdump \
    traceroute \
    vim \
    less \
    && apt clean && rm -rf /var/lib/apt/lists/*

CMD ["/bin/bash"]

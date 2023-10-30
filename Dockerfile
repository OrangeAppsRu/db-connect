FROM docker.io/ubuntu:20.04
LABEL org.opencontainers.image.source https://github.com/orangeappsru/db-connect

RUN apt-get update && \
    apt-get install --no-install-recommends -y \
        vim \
        bash-completion \
        iputils-ping \
        dnsutils \
        nano \
        tmux \
        curl \
        ca-certificates \
        mysql-client \
        redis-tools \
        nodejs \
        gnupg \
        libcurl4 \
        openssl \
        liblzma5 \
        wget && \
        wget https://repo.mongodb.org/apt/ubuntu/dists/focal/mongodb-org/5.0/multiverse/binary-amd64/mongodb-org-shell_5.0.22_amd64.deb && \
        dpkg -i mongodb-org-shell_5.0.22_amd64.deb && \
        apt-get autoclean && \
        apt-get clean && \
        rm -rf /var/lib/apt/lists/* && \
        rm -fv /bin/sh && \
        ln -s -v /bin/bash /bin/sh

COPY ./.bash_profile /root/
COPY ./entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]

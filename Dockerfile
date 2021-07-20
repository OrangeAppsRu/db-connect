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
        mysql-client \
        redis-tools \
        mongodb-clients \
        mongo-tools \
        nodejs && \
    apt-get autoclean && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -fv /bin/sh && \
    ln -s -v /bin/bash /bin/sh

COPY ./.bash_profile /root/
COPY ./entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]

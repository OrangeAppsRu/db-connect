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
        gnupg && \
    echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/4.4 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-4.4.list && \
    curl https://www.mongodb.org/static/pgp/server-4.4.asc | apt-key add - && \
    apt-get update && \
    apt-get --no-install-recommends -y install mongodb-org-shell && \
    apt-get autoclean && \
    apt-get clean && \
    
    rm -rf /var/lib/apt/lists/* && \
    rm -fv /bin/sh && \
    ln -s -v /bin/bash /bin/sh

COPY ./.bash_profile /root/
COPY ./entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]

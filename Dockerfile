FROM docker.io/ubuntu:22.04
LABEL org.opencontainers.image.source https://github.com/orangeappsru/db-connect

RUN apt-get update \
    && apt-get install --no-install-recommends -y \
        vim \
        bash-completion \
        iputils-ping \
        dnsutils \
        nano \
        tmux \
        screen \
        curl \
        ca-certificates \
        mysql-client \
        redis-tools \
        nodejs \
        gnupg \
        libcurl4 \
        openssl \
        liblzma5 \
    && curl -o mongodb-mongosh_2.2.0_amd64.deb 'https://repo.mongodb.org/apt/ubuntu/dists/jammy/mongodb-org/5.0/multiverse/binary-amd64/mongodb-mongosh_2.2.0_amd64.deb' \
    && dpkg -i mongodb-mongosh_2.2.0_amd64.deb \
    && rm -fv mongodb-mongosh_2.2.0_amd64.deb \
    && apt-get autoclean \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && rm -fv /bin/sh \
    && ln -s -v /bin/bash /bin/sh \
    && mkdir /user

COPY ./.bash_profile /user/
COPY ./.tmux.conf /user/
RUN chmod 755 /user; chmod 755 /user/.bash_profile; chmod 644 /user/.tmux.conf
COPY ./entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]

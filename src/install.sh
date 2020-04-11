#!/bin/bash

# Replace mirror list
apt-get -y update
apt-get -y install curl ca-certificates apt-utils
mv /tmp/src/sources.list /etc/apt/sources.list

# Node.js
curl -sL https://deb.nodesource.com/setup_13.x | bash -

# Upgrade & Install packages
apt-get -y upgrade
apt-get -y install \
    wget sudo fish git iproute2 \
    build-essential \
    php php-xml \
    nodejs yarn

# Cleanup
apt-get -y clean

# Code Server
cd /usr/local/src
mkdir -p code-server
curl -sSL https://github.com/cdr/code-server/releases/download/3.1.0/code-server-3.1.0-linux-x86_64.tar.gz > ./code-server.tar.gz
tar xf ./code-server.tar.gz -C code-server --strip-components 1
mv /tmp/src/entrypoint.sh /usr/local/bin/code-server

# Users
useradd -l -U -m workspace

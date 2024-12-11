#!/bin/bash

set -eux
bash --version

apt-get update 
apt-get upgrade -y
apt-get install -y software-properties-common 
node_file=nodesource_setup.sh
wget -O ${node_file} https://deb.nodesource.com/setup_23.x
chmod +x ${node_file}
./${node_file}
# curl -sL https://deb.nodesource.com/setup_220.x | bash - 

apt-get install -y nodejs

node -v 
node --versionnpm -v
npm --version

corepack enable yarn 
yarn set version stable

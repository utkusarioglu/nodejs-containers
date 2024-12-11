#!/bin/bash

set -eux
bash --version

apt-get update 
apt-get upgrade -y
apt-get install -y software-properties-common 
wget -O nodesource_setup.sh https://deb.nodesource.com/setup_23.x
./nodesource_setup.sh
# curl -sL https://deb.nodesource.com/setup_220.x | bash - 

apt-get install -y nodejs

node -v 
node --versionnpm -v
npm --version

corepack enable yarn 
yarn set version stable

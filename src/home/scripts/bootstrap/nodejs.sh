#!/bin/bash

set -eux
bash --version

apt-get update 
apt-get upgrade -y
apt-get install -y software-properties-common 
curl -sL https://deb.nodesource.com/setup_220.x | sudo -E bash - 

apt-get install -y nodejs

node -v 
node --versionnpm -v
npm --version

corepack enable yarn 
yarn set version stable

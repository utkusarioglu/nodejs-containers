#!/bin/bash

set -eux
bash --version

ARGS=(
  node_version
)

# from base image
. ${0%/*}/parse-args.sh

apt-get update 
apt-get upgrade -y
apt-get install -y software-properties-common 
node_file=nodesource_setup.sh
wget -O ${node_file} https://deb.nodesource.com/setup_${node_version}.x
chmod +x ${node_file}
./${node_file}
rm -rf ${node_file}

apt-get install -y nodejs

node -v 
corepack --version

corepack enable yarn
yarn set version stable
yarn --version
rm package.json

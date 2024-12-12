#!/bin/bash

set -eux
bash --version

ARGS=(
  node_version
)
. ${0%/*}/../linux/parse-args.sh

node_file=nodesource_setup.sh
wget -O ${node_file} https://deb.nodesource.com/setup_${node_version}
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

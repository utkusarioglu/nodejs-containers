# ARG IMAGE_TAG

# FROM node:$IMAGE_TAG

# ARG USERNAME
# ARG GROUP
# ARG ROOT_PASS
# ARG YQ_VERSION="v4.28.1"
# ARG NVIM_VERSION="v0.8.3"
# ARG HOME="/home/${USERNAME}"
# ARG ELAM_ABSPATH="$HOME/elam"

# RUN for arg in ROOT_PASS USERNAME GROUP; \
#   do \
#   [ ! -z "${arg}" ] || { echo "ARG \"$arg\" needs to be set"; exit 1; } \
#   done;

# RUN echo "root:$ROOT_PASS" | chpasswd

# RUN apt-get update && apt-get upgrade -y && apt-get install -y \
#   git \
#   jq \
#   libc6 \
#   libgcc-s1 \
#   htop \
#   wget 

# Yq requires manual retrieval of the package
# RUN wget \
#   https://github.com/mikefarah/yq/releases/download/$YQ_VERSION/yq_linux_amd64 \
#   -O /usr/bin/yq && \
#   chmod +x /usr/bin/yq

# Neovim requires manual retrieval of the latest version
# as the apt package is quite old
# RUN wget https://github.com/neovim/neovim/releases/download/$NVIM_VERSION/nvim-linux64.deb \
#   -O /neovim.deb
# RUN apt install -y /neovim.deb 
# RUN rm /neovim.deb
# ENV EDITOR=nvim

ARG BASH_TAG

FROM utkusarioglu/bash-devcontainer:${BASH_TAG}

WORKDIR ${HOME}

COPY home/scripts/* scripts/

USER root

RUN scripts/bootstrap/nodejs.sh

# RUN apt update && apt upgrade && apt install -y nodejs

# Needed for yarn
# RUN corepack enable yarn 
# RUN yarn set version stable


# USER $USERNAME

# # Gists
# ADD --chown=$USERNAME:$GROUP \
#   https://gist.githubusercontent.com/utkusarioglu/2d4be44dc7707afccd540ad99ba385e6/raw/create-env-example.sh \
#   /scripts/create-env-example.sh
# ADD --chown=$USERNAME:$GROUP \
#   https://gist.githubusercontent.com/utkusarioglu/3523b00578807d63b05399fe57a4b2a7/raw/.bashrc \
#   $HOME/.bashrc
# ADD --chown=$USERNAME:$GROUP \
#   https://gist.githubusercontent.com/utkusarioglu/d5c216c744460c45bf6260d0de4131b4/raw/.inputrc \
#   $HOME/.inputrc
# RUN chmod +x \
#   /scripts/create-env-example.sh \
#   $HOME/.bashrc \
#   $HOME/.inputrc

# # Elam
# RUN git clone https://github.com/utkusarioglu/elam.git $ELAM_ABSPATH
# RUN echo "alias elam=$ELAM_ABSPATH/elam.sh" >> $HOME/.bash_aliases

USER dev

COPY home/scripts .

# RUN mkdir -p $HOME/.vscode-server/extensions
# RUN mkdir -p $HOME/.vscode-server-insiders/extensions

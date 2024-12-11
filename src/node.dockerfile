ARG BASE_IMAGE

FROM utkusarioglu/bash-devcontainer:${BASE_TAG}

ARG NODE_VERSION

ARG USER_ID=1000
ARG GROU_ID=1000
ARG DEFAULT_USER=dev
ARG HOME_ABSPATH=/home/${DEFAULT_USER}

WORKDIR ${HOME_ABSPATH}

USER root

COPY home/scripts scripts/

# from base image
RUN scripts/bootstrap/set-path-permissions.sh \
  ${USER_ID} \
  ${GROUP_ID} \
  ${HOME_ABSPATH}

RUN scripts/bootstrap/install-nodejs.sh ${NODE_VERSION}

USER ${DEFAULT_USER}

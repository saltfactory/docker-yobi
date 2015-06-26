#!/bin/bash

# set -e
# docker build -t saltfactory/yobi:0.8.1 .
# echo $1
# YOBI_VERSION
. ./config.sh
DOCKER_YOBI_IMAGE="saltfactory/yobi:$YOBI_VERSION"

function build_default {
  echo "*** [Building]  $DOCKER_YOBI_IMAGE by yobi full package ***"
  docker build -t $DOCKER_YOBI_IMAGE .
}

if [ -n "$1" ]; then
  if [ $1 = "sources" ]; then
    echo "*** [Building]  $DOCKER_YOBI_IMAGE by yobi sources ***"
    echo $YOBI_HOME
    if [ ! -d $YOBI_HOME ]; then
      git clone https://github.com/naver/yobi.git $YOBI_HOME
    fi
    docker build -t $DOCKER_YOBI_IMAGE -f Dockerfile-yobi-sources .
  else
    build_default
  fi
else
  build_default
fi


echo "*** [Done] ***"

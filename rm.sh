#!/bin/bash

. ./config.sh

echo "*** [Removing] NAME: $DOCKER_YOBI_NAME, PORT: $DOCKER_YOBI_PORT  YOBI_HOME : $YOBI_HOME ***"

if [[ -n $(docker ps -a | grep $DOCKER_YOBI_NAME) ]] ; then
  docker rm $(docker ps -a  | grep $DOCKER_YOBI_NAME | awk '{print $1}')
else
  echo "$DOCKER_YOBI_NAME is not eixst!"
fi
echo "*** [Done] ***"

#!/bin/bash

. ./config.sh


if [ -z $1 ]; then
  COMMAND="/bin/bash"
fi

if [[ -n $(docker ps | grep $DOCKER_YOBI_NAME) ]] ; then
  docker exec -it $DOCKER_YOBI_NAME $COMMAND
else
  echo "$DOCKER_YOBI_NAME is not running"
fi

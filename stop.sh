#!/bin/bash

. ./config.sh

echo "*** [Stoping] NAME: $DOCKER_YOBI_NAME, PORT: $DOCKER_YOBI_PORT  YOBI_HOME : $YOBI_HOME ***"


if [ -f "$YOBI_HOME/RUNNING_PID" ];then
  rm $YOBI_HOME/RUNNING_PID
fi

if [[ -n $(docker ps | grep $DOCKER_YOBI_NAME) ]] ; then
  docker stop $DOCKER_YOBI_NAME
else
  echo "$DOCKER_YOBI_NAME is not running"
fi

echo "*** [Done] ***"

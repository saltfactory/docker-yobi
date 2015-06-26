#!/bin/bash

. ./config.sh

echo "*** [Stoping] NAME: $DOCKER_YOBI_NAME, PORT: $DOCKER_YOBI_PORT  YOBI_HOME : $YOBI_HOME ***"
docker stop $DOCKER_YOBI_NAME

if [ -f "$YOBI_HOME/RUNNING_PID" ];
then
  rm $YOBI_HOME/RUNNING_PID
fi
echo "*** [Done] ***"

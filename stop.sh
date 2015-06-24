#!/bin/bash

source ./config.sh

echo "****[Stoping] NAME: $DOCKER_YOBI_NAME, PORT: $DOCKER_YOBI_PORT  YOBI_HOME : $YOBI_HOME\n"
docker stop $DOCKER_YOBI_NAME

if [ -f "$YOBI_HOME/RUNNING_PID" ];
then
  rm $YOBI_HOME/RUNNING_PID
fi
echo "\n[Done]\n****\n"

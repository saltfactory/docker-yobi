#!/bin/bash

# echo $YOBI_HOME
source ./config.sh

if [ ! -d "$YOBI_HOME" ];
then
  echo "$YOBI_HOME is not exists!"
  echo "this command need -h(--home) option that is YOBI_HOME directory path in host\nex) sh run.sh -h ./yobi/"
  exit
else
  if [ -f "$YOBI_HOME/RUNNING_PID" ];
  then
    rm $YOBI_HOME/RUNNING_PID
    echo "*** [Restarting] NAME: $DOCKER_YOBI_NAME, PORT: $DOCKER_YOBI_PORT  YOBI_HOME : $YOBI_HOME ***"
    docker restart $DOCKER_YOBI_NAME
  else
    echo "*** [Starting] NAME: $DOCKER_YOBI_NAME, PORT: $DOCKER_YOBI_PORT  YOBI_HOME : $YOBI_HOME ***"
    docker run --name $DOCKER_YOBI_NAME \
    -d -p $DOCKER_YOBI_PORT:9000 \
    -v $YOBI_HOME:/yobi/home \
    saltfactory/yobi:0.8.1
  fi
  echo "*** [Done] ***"
fi

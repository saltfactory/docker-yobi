#!/bin/bash

# echo $YOBI_HOME
. ./config.sh

function start_container {
  echo "*** [Starting] NAME: $DOCKER_YOBI_NAME, PORT: $DOCKER_YOBI_PORT  YOBI_HOME : $YOBI_HOME ***"
  docker run --name $DOCKER_YOBI_NAME \
  -d -p $DOCKER_YOBI_PORT:9000 \
  -v $YOBI_HOME:/yobi/home \
  saltfactory/yobi:0.8.1
}

if [ ! -d "$YOBI_HOME" ];then
  echo "*** [Notice] *****************************************"
  echo "$YOBI_HOME is not exists!"
  echo "*** [Solution] ***************************************"
  echo "1. create default YOBI_HOME $(pwd)/yobi"
  echo "2. open config.sh and set your directory to YOBI_HOME"
  echo "******************************************************"
  exit
else

  if [[ -n $(docker ps | grep $DOCKER_YOBI_NAME) ]]; then
    if [ -f "$YOBI_HOME/RUNNING_PID" ];then
      rm $YOBI_HOME/RUNNING_PID
    fi
    echo "*** [Restarting] NAME: $DOCKER_YOBI_NAME, PORT: $DOCKER_YOBI_PORT  YOBI_HOME : $YOBI_HOME ***"
    docker restart $DOCKER_YOBI_NAME
  else
    if [[ -n $(docker ps -a | grep $DOCKER_YOBI_NAME) ]]; then
      docker rm $DOCKER_YOBI_NAME
      start_container
    else
      start_container
    fi
  fi

  echo "*** [Done] ***"
fi

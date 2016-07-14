#!/bin/bash

source ./shell/config.sh

echo $YONA_HOME

if [ ! -n "$YONA_HOME" ]; then
  YONA_HOME=$PWD/yona
fi

function is_running {
  docker ps | grep $DOCKER_CONTAINER_NAME
}

function is_exists {
  docker ps -a  | grep $DOCKER_CONTAINER_NAME
}

function build_image {
  if [ ! -d $YONA_HOME ]; then
    mkdir -p $YONA_HOME
  fi
  echo "*** [Building] \"$DOCKER_IMAGE\" via full package ***"

  docker build -t $DOCKER_IMAGE .
}

function init_container {
  remove_containers

  echo "*** [init YONA full pakage] Name: \"$DOCKER_CONTAINER_NAME\" PORT: $DOCKER_CONTAINER_PORT ***"
  docker run \
  --name $DOCKER_CONTAINER_NAME \
  --restart always \
  -p $DOCKER_CONTAINER_PORT:9000 \
  -v $YONA_HOME:/yona/home \
  -e JAVA_OPT="$JAVA_OPT" \
  -e BEFORE_SCRIPT=before.sh \
  -d \
  $DOCKER_IMAGE

  docker ps
}

function start_container {
  if [[ -n $(is_running) ]]; then
    echo "*** \"$DOCKER_CONTAINER_NAME\" is running! ***"
  else
    if [[ -n $(is_exists) ]]; then
      echo "*** [init] Name: \"$DOCKER_CONTAINER_NAME\" PORT: $DOCKER_CONTAINER_PORT ***"
      docker start $DOCKER_CONTAINER_NAME
    else
      init_container
    fi
  fi
}

function restart_container {
  if [[ -n $(is_running) ]]; then
    if [ -f "$YONA_HOME/RUNNING_PID" ];then
      rm $YONA_HOME/RUNNING_PID
    fi
    echo "*** [restart] Name: \"$DOCKER_CONTAINER_NAME\" PORT: $DOCKER_CONTAINER_PORT ***"
    docker restart $DOCKER_CONTAINER_NAME
  else
    echo "*** \"$DOCKER_CONTAINER_NAME\" is not running! ***"
  fi
}

function stop_container {
  if [[ -n $(is_running) ]]; then
    echo "*** [stop] Name: \"$DOCKER_CONTAINER_NAME\" PORT: $DOCKER_CONTAINER_PORT ***"
    docker stop $DOCKER_CONTAINER_NAME

    if [ -f "$YONA_HOME/RUNNING_PID" ];then
      rm $YONA_HOME/RUNNING_PID
    fi

  else
    echo "*** \"$DOCKER_CONTAINER_NAME\" is not running! ***"
  fi
}

function remove_containers {
  stop_container

  if [ -n "$(docker ps -a  | grep $DOCKER_CONTAINER_NAME)" ]; then
    echo "*** [removing] Name: \"$DOCKER_CONTAINER_NAME\" PORT: $DOCKER_CONTAINER_PORT ***"
    docker rm $(docker ps -a  | grep $DOCKER_CONTAINER_NAME | awk '{print $1}')
  else
    echo "*** \"$DOCKER_CONTAINER_NAME\" is not exist! ***"
  fi
}

function log_containers {
  docker logs $DOCKER_CONTAINER_NAME
}

function exec_container {
  docker exec -it $DOCKER_CONTAINER_NAME bash
}

echo "*** [Run] *** "
if [ -n "$1" ]; then
  case "$1" in
  build)
    build_image $2
  ;;
  init)
    init_container
  ;;
  start)
    start_container
  ;;
  restart)
    restart_container
  ;;
  stop)
    stop_container
  ;;
  remove|rm)
    remove_containers
  ;;
  log|logs)
    log_containers
  ;;
  exec)
    exec_container
  ;;
  *)
    echo "option is not valid!"
  ;;
  esac
fi

echo "*** [Done] *** "

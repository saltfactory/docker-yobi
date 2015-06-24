#!/bin/bash

source ./config.sh

echo "*** [Removing] NAME: $DOCKER_YOBI_NAME, PORT: $DOCKER_YOBI_PORT  YOBI_HOME : $YOBI_HOME ***"
docker rm $DOCKER_YOBI_NAME
echo "*** [Done] ***"

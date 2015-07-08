#!/bin/bash

############################################################
## docker project name
PROJECT_NAME="docker-yobi"
############################################################
## docker configurations
DOCKER_USER="saltfactory"
DOCKER_VERSION="0.8.2"
DOCKER_NAME="yobi"
DOCKER_IMAGE="$DOCKER_USER/$DOCKER_NAME:$DOCKER_VERSION"
############################################################
## container configurations
DOCKER_CONTAINER_NAME="demo-yobi"
DOCKER_CONTAINER_PORT="7001"
############################################################
## container volumes
YOBI_SOURCE="/Users/saltfactory/shared/yobi-0.8.2"
YOBI_HOME="/Users/saltfactory/shared/yobi-0.8.2"
YOBI_OPT="-Xmx1024m -Xms1024m"
############################################################

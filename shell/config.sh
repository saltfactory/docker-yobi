#!/bin/bash

############################################################
## docker project name
PROJECT_NAME="docker-yona"
############################################################
## docker configurations
DOCKER_USER="pokev25"
DOCKER_VERSION="1.0.2"
DOCKER_NAME="yona"
DOCKER_IMAGE="$DOCKER_USER/$DOCKER_NAME:$DOCKER_VERSION"
############################################################
## container configurations
DOCKER_CONTAINER_NAME="yona"
DOCKER_CONTAINER_PORT="9000"
############################################################
# YONA_HOME="/home/user/yona-home"
JAVA_OPT="-Xmx1024m -Xms1024m"
############################################################

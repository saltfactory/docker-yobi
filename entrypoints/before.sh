#!/bin/bash

if [ -f "$YONA_HOME/RUNNING_PID" ];then
  rm $YONA_HOME/RUNNING_PID
  echo "*** [rm] $YONA_HOME/RUNNING_PID ***"
fi

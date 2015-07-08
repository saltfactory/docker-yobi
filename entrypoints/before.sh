#!/bin/bash

if [ -f "$YOBI_HOME/RUNNING_PID" ];then
  rm $YOBI_HOME/RUNNING_PID
  echo "*** [rm] $YOBI_HOME/RUNNING_PID ***"
fi

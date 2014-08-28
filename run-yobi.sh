#!/bin/bash

YOBI_HOME=$1

if [ -f $YOBI_HOME/RUNNING_PID ];
then
  rm -rf $YOBI_HOME/RUNNING_PID
  docker start yobi
else
  docker stop yboi
  docker rm yobi
  docker run --name yobi \
  -d -p 9000:9000 \
  -v $YOBI_HOME:/home/yobi/yobi \
  saltfactory/yobi
fi

docker ps

# if [ -f $YOBI_HOME/yobi.lock.db ];
# then
#   rm -rf $YOBI_HOME/yobi.lock.db
# fi



# docker run -t -i --privileged=true --name yobi \
# --user yobi \
# -d -p 9000:9000 \
# -v $YOBI_HOME:/home/yobi/yobi \
# saltfactory/yobi \
# /bin/bash

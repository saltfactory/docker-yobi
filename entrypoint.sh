#!/bin/bash

echo $YOBI_HOME
cd /yobi/home; activator "start -DapplyEvolutions.default=true -Dhttp.port=9000"

#!/bin/bash

# echo $YOBI_HOME
# cd /yobi/home; activator "start -DapplyEvolutions.default=true -Dhttp.port=9000"


#!/bin/bash
set -e

if [ -n "$BEFORE_SCRIPT" ]; then
  set +e
  echo "*** [RUN BEFORE_SCRIPT] ***"
  chmod +x /yobi/entrypoints/$BEFORE_SCRIPT
  /bin/bash /yobi/entrypoints/$BEFORE_SCRIPT
  echo "*** [DONE BEFORE_SCRIPT] ***"
  set -e
fi

## if source files from volume, replace home with sources, files volume only used when it's not source build.
if [ -n "$(ls -A /yobi/source)" ]; then
  mv /yobi/release /yobi/release.bak
  ln -s /yobi/source /yobi/release
  echo "*** Straing container yobi source... ***"
  cd /yobi/release; activator "start -DapplyEvolutions.default=true -Dhttp.port=9000"
else
  echo "*** Straing container yobi bin ... ***"
  cd /yobi/release; bin/yobi
  # docker mv /yobi/release /yobi/release.bak
  # ln -s /yobi/release /yobi/home
fi



# echo "$@"
# exec "$@"

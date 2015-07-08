#!/bin/bash
set -e

# cd /yobi/home; activator "start -DapplyEvolutions.default=true -Dhttp.port=9000"

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
  cd /yobi/release/yobi-0.8.2; bin/yobi
fi



# echo "$@"
# exec "$@"

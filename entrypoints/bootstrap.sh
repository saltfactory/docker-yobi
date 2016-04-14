#!/bin/bash
set -e

# cd /yona/home; activator "start -DapplyEvolutions.default=true -Dhttp.port=9000"

if [ -n "$BEFORE_SCRIPT" ]; then
  set +e
  echo "*** [RUN BEFORE_SCRIPT] ***"
  chmod +x /yona/entrypoints/$BEFORE_SCRIPT
  /bin/bash /yona/entrypoints/$BEFORE_SCRIPT
  echo "*** [DONE BEFORE_SCRIPT] ***"
  set -e
fi

## if source files from volume, replace home with sources, files volume only used when it's not source build.
if [ -n "$(ls -A /yona/source)" ]; then
  mv /yona/release /yona/release.bak
  ln -s /yona/source /yona/release
  echo "*** Straing container yona source... ***"
  cd /yona/release; activator "start -DapplyEvolutions.default=true -Dhttp.port=9000"
else
  echo "*** Straing container yona bin ... ***"
  cd /yona/release/yona-1.0.1; bin/yona
fi



# echo "$@"
# exec "$@"

#!/bin/sh

# npm run start -- > stdout.txt 2> stderr.txt &
# sleep 40
# shellcheck disable=SC2086
exec /sbin/tini -g -- \
  wait-for --timeout "${WAIT_FOR_TIMEOUT:-10}" $WAIT_FOR_HOSTS -- \
  nightwatch "$@"
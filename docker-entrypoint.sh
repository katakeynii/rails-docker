#!/bin/sh
set -e

if [ -f tmp/pids/server.pid ]; then
  rm -rf tmp/pids/server.pid
fi

# exec bundle exec "$@"

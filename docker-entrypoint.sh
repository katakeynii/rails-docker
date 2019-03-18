#!/bin/sh
set -e

if [ -f tmp/pids/server.pid ]; then
  rm -rf tmp/pids/server.pid
fi

bundle check || bundle install --binstubs="$BUNDLE_BIN"
# Ensure all gems installed. Add binstubs to bin which has been added to PATH in Dockerfile.

# bundle exec rails s -b 0.0.0.0


exec "$@"
# exec bundle exec "$@"

# exec bundle exec "$@"

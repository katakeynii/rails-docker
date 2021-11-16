#!/bin/bash

# exit on error
set -e

# start puma
# puma -C config/puma.rb
# environment=$(grep RAILS_ENV .env | cut -d '=' -f2)
environment=$1

echo "====================================="
echo "====================================="
echo "====================================="
echo $environment
foreman start -f Procfile.${environment}

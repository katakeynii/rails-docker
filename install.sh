#!/bin/bash

# exit on error
set -e

red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`

echo "${green}=================================================="
echo "${green}===== GENERATING A NEW RAILS APP ================="
echo "${green}=================================================="

mv .env.default .env
docker-compose run app rails new . -d postgresql
mv default.database.yml config/database.yml


sudo rm -rf install.sh

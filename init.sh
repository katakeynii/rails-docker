#!/bin/bash


echo "=================================================="
echo "============= STARTING RAILS APP ================="
echo "=================================================="
echo "-"
echo "-"

sudo chmod 755 -R .	
sudo docker-compose build 
sudo docker-compose run app rails new . -d postgresql
echo "------------------------------------"
echo "------------------------------------"
sudo mv default.database.yml ./config/database.yml
# sudo docker-compose run app rails db:create db:migrate 
sudo docker-compose up
# sudo chown -R $USER:$USER .
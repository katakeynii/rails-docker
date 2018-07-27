#!/bin/bash


echo "=================================================="
echo "============= STARTING RAILS APP ================="
echo "=================================================="
echo "-"
echo "-"

sudo chmod 755 -R .	
sudo docker-compose build 
# sudo chown -R $USER:$USER .
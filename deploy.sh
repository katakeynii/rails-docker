#!/bin/bash

# exit on error
set -e

function deploy(){
	cat <<- EOF
	=====================DEPLOYING=======================
	EOF
	sudo docker-compose -f prod.docker-compose.yml run prod_app ./deploytask.sh		
          
}


deploy 
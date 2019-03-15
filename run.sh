#!/bin/bash


# Not supported yet database
#frontbase/ibm_db/sqlserver/jdbcmysql/jdbcsqlite3/jdbcpostgresql/jdbc
red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`

echo "${green}=================================================="
echo "${green}===== GENERATING A NEW RAILS APP ================="
echo "${green}=================================================="
echo "${green}-"
echo "${green}-"
echo "${green}--------------------------------------------------"
echo "${green}--------------------------------------------------"
USAGE=$(cat <<-END
		NB: All options available while creating a rails app 
		with 'rails new' are available here .
		And don't forget to give to your user the owner 
		Ex: chown -R <your_user><your_user> .

		--------------------------------------------------
		--------------------------------------------------

    NB: Tous les options disponibles avec la commande 
    'rails new' sont disponibles ici.
    Et n'oubliez pas de donner à votre utilisateur la propriété et
    tous les droits nécessaire
		Ex: chown -R <your_user><your_user> .
END
)
echo "${red} $USAGE"
echo "${reset}"

sudo touch .env
sudo docker-compose run app rails new . -d postgresql
sudo chmod 755 -R .	
# sudo chown -R $USER:$USER .
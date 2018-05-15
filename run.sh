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

if [ $1 == "--help" ]
then
	echo "showing rails new help ..."
	sudo docker-compose run app rails new --help

else
	if [$1 != "mysql" && $1 != "postgresql" && $1 != "sqlite3" && $1 != "oracle"]
	then
		echo "====================================="
		echo "=== ERROR DATABASE NOT SUPPORTED ===="
		echo "====================================="
		echo "only mysql, postgresql, sqlite3 and oracle are supported "
	else
			sudo docker-compose run app rails new . -d $1 $@

	fi
fi
sudo chmod 755 -R .	
# sudo chown -R $USER:$USER .
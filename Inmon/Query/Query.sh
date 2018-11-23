#!/bin/bash

Connection (){
	echo
        echo "MYSQL接続 as $User"
	mysql -u $User -p$Password
	if [ "$?" -eq 1 ]
	then
		echo "MYSQLConnection False"
		return 0
	fi

        time mysql -u $User -p$Password -e "source $SQLFile"
	if [ "$?" -eq 1 ]
	then
		echo "MYSQL接続失敗"
	else
		echo
	fi
}

read -p "SQLFile名 : " SQLFile
read -p "User名 : " User
read -s -p "Password : " Password
Connection

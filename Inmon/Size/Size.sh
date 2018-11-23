#!/bin/bash
#my.cnfファイルが存在するか
Pass(){
        FILE="my.cnf"
        if [ -f $FILE ]; then
                Connect
        else
                echo "my.cnfファイルを新規作成"
                echo "[client]" > $FILE
                read -p "UserName : " UserName
                echo "user = $UserName" >> $FILE
                read -s -p "Password : " Password
                echo "password = $Password" >> $FILE
                echo
                read -p "HostName : " HostName
                echo "host = $HostName" >> $FILE
                echo "my.cnfファイル新規作成完了"
                Connect
        fi
}

#MYSQL接続テスト
Connect(){
        mysql --defaults-extra-file=./my.cnf -e"\q"
        echo "MYSQL接続中..."
        if [ $? -eq 1 ]; then
                echo "MYSQL接続 : False"
                echo "my.cnfFile内を確認"
                exit 1
	else
		echo "MYSQL接続 : Done"
        fi
}

Query (){
	echo "クエリ実行結果"
        mysql --defaults-extra-file=./my.cnf -e "source ./Size.sql"
}

Main (){
	Pass
	Query
}
Main

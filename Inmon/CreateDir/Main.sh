#!/bin/bash

#my.cnfファイルが存在するか
Pass(){
        FILE="my.cnf"
        if [[ -f $FILE ]]; then
                time ./Create.sh
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
                time ./Create.sh
        fi
}

echo "DWHをInmonモデルで構築..."
Pass

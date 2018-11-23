#!/bin/bash

#my.cnfファイルが存在するか
Pass(){
	FILE="my.cnf"
	if [[ -f $FILE ]]; then
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
	echo "MYSQLへ接続中..."
	mysql --defaults-extra-file=./my.cnf -e"\q"
	if [ $? -eq 1 ]; then
		echo "MYSQL接続 : False"
	     	echo "my.cnfFile内を確認"
		exit 1
	else
		echo "MYSQL接続 : Done"
	fi
}

#DBが存在するか
Createtest(){
	CreateDB
	if [ $? -eq 1 ]; then
		echo "既存のDWH,DM1,DM2,DM3を削除"
		DeleteDB
		echo "DWH,DM1,DM2,DM3を再作成中..."
		CreateDB
		if [ $? -eq 1 ]; then
			echo "DWH,DM1,DM2,DM3再作成 : False"
			exit 1
		else
			echo "DWH,DM1,DM2,DM3再作成 : Done"
		fi
	else
		echo "DWH,DM1,DM2,DM3作成 : Done"
	fi
}
#DB作成
CreateDB(){
	mysql --defaults-extra-file=./my.cnf -e "source ./Create_Database.sql"
}
#DB削除
DeleteDB(){
	mysql --defaults-extra-file=./my.cnf -e "source ./Delete_Database.sql"
}

#DWHの構築
DWH(){
	echo "DWHを構築中..."
	mysql --defaults-extra-file=./my.cnf <<EOF
begin;
use Inmon_DWH; 
source ./DWH_Table/Category1.sql;
source ./DWH_Table/Category2.sql
source ./DWH_Table/Date.sql;
source ./DWH_Table/Official_tweet.sql;
source ./DWH_Table/Stories.sql;
source ./DWH_Table/Category.sql;
source ./DWH_Table/Sale.sql;
commit;
source ./DWH_Data/Category1.sql;
source ./DWH_Data/Category2.sql;
source ./DWH_Data/Date.sql;
source ./DWH_Data/Official_tweet.sql;
source ./DWH_Data/Stories.sql;
source ./DWH_Data/Category.sql;
source ./DWH_Data/Sale.sql;
commit;
EOF
if [ $? -eq 1 ]; then
	echo "DWH構築 : False"
	exit 1
else
	echo "DWH構築 : Done"
fi
}

#DM1の構築
DM1(){
	echo "DM1を構築中..."
        mysql --defaults-extra-file=./my.cnf <<EOF
begin;
use Inmon_DM1;
source ./DM1_Table/Date.sql;
source ./DM1_Table/Sale.sql;
commit;
source ./DM1_Data/Date.sql;
source ./DM1_Data/Sale.sql;
commit;
EOF
if [ $? -eq 1 ]; then
        echo "DM1構築 : False"
	exit 1
else
        echo "DM1構築 : Done"
fi
}

#DM2の構築
DM2(){
        echo "DM2を構築中..."
        mysql --defaults-extra-file=./my.cnf <<EOF
begin;
use Inmon_DM2;
source ./DM2_Table/Category.sql;
source ./DM2_Table/Official_tweet.sql;
source ./DM2_Table/Sale.sql;
commit;
source ./DM2_Data/Category.sql;
source ./DM2_Data/Official_tweet.sql;
source ./DM2_Data/Sale.sql;
commit;
EOF
if [ $? -eq 1 ]; then
        echo "DM2構築失敗 : False"
	exit 1
else
        echo "DM2構築成功 : Done"
fi
}

#DM3の構築
DM3(){
        echo "DM3を構築中..."
        mysql --defaults-extra-file=./my.cnf <<EOF
begin;
use Inmon_DM3;
source ./DM3_Table/Category.sql;
source ./DM3_Table/Stories.sql;
source ./DM3_Table/Sale.sql;
commit;
source ./DM3_Data/Category.sql;
source ./DM3_Data/Stories.sql;
source ./DM3_Data/Sale.sql;
commit;
EOF
if [ $? -eq 1 ]; then
        echo "DM3構築 : False"
	exit 1
else
        echo "DM3構築 : Done"
fi
}



Main(){
echo "DWHをInmonモデルで構築..."
Pass
Createtest
DWH
DM1
DM2
DM3
echo "構築完了"
}

Main

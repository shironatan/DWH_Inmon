#!/bin/bash
#ファイルが存在するか
File(){
	if [ ! -f $1 ]
       	then
		echo "存在しないファイル名です"
		exit 1
	else
		SQLFILE=$1
	fi
}
#項目を取り出す(引数：ファイル名)
Colum(){
	local i=2
	local j=3
	local colum
	#カラムをきれいにする
	local colum_list=`sed -n '2p' $1`
	colum=`echo $colum_list | cut -d' ' -f1`
	echo $colum
	if [ "$colum" != "SELECT" ] && [ "$colum" != "select" ]
	then
		echo "2行目にSELECT文があるファイルにしてください"
		exit 1
	fi
	colum=`echo $colum_list | cut -d' ' -f$i`
	while [ "$colum" != "" ]
	do
		if [ "AS" == `echo $colum_list | cut -d' ' -f$(( $i + 1 ))` ] #ASがある場合
		then
			echo $colum
			ARRAY+=(`echo $colum_list | awk '{print $'$(( $i + 2 ))'}' | sed 's/,//'`)
			i=$(( $i + 3 ))
		else
			echo $colum
			ARRAY+=(`echo $colum | sed 's/,//'`)
			i=$(( $i + 1 ))
		fi
		colum=`echo $colum_list | cut -d' ' -f$i`
	done
}
#並び替え
Sort(){
	local colum
	echo "/* 項目一覧 */"
	echo "${ARRAY[@]}"
	read -p "ORDER BYに指定する項目を優先度が高いものから選んでください[終了:q]：" colum
	while [ "$colum" != "q" ]
	do
		COLUM+=("$colum")
		read -p "DESC/ASC：" colum
		Check $colum
		COLUM+=("$colum")
		read -p "ORDER BYに指定する項目を優先度が高いものから選んでください[終了:q]：" colum
	done
	if [ 0 -eq "${#COLUM[@]}" ]
	then
		echo "ORDER指定なし、終了します。"
	fi
}
#DESC/ASC判定
Check(){
	if [ ! "`echo "$1" | grep -i -e "^desc$" -e "^asc$"`" == $1 ]
	then
		echo -e "DESC/ASCではない入力\n最初からやり直してください。"
		exit 1
	fi
}
#SQLを組み立てる(引数：ファイル名）
Update_SQL(){
	local e
	local i=0
	local ordersql
	for e in "${COLUM[@]}"
	do
		if [ $i -eq 0 ]
		then
			ordersql="ORDER BY ${COLUM[$i]} ${COLUM[$i+1]}"
		else
			ordersql="$ordersql, ${COLUM[$i]} ${COLUM[$i+1]}"
		fi
		i=$(( $i + 2 ))
		if [ $i -eq ${#COLUM[@]} ]
		then
			break
		fi
	done
	#組み立て
	local tail1 tail2
	tail1=`tail -n 1 $SQLFILE`
	tail2=`tail -n 1 $SQLFILE | sed 's/;//'`
	{ cat $1 | sed -e "s/$tail1/$tail2/";
		echo "$ordersql;";
	} > okikae.sql
	cp okikae.sql $SQLFILE
	rm -f okikae.sql

}
echo "ORDER BYつきのSQLにする(２行目がSELECT文のみ可能)"
read -p "ファイル名を指定(拡張子あり)：" file
File $file
Colum $SQLFILE
Sort
Update_SQL $SQLFILE

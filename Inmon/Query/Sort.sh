#!/bin/bash
#ファイルが存在するか
File(){
	echo $1
	if [ ! -f $1 ];
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
	colum=`sed -n '2p' $1 | awk '{print $1}'`
	if [ "$colum" != "SELECT" ] && [ "$colum" != "select" ];
	then
		echo "2行目にSELECT文があるファイルにしてください"
		exit 1
	fi
	colum=`sed -n '2p' $1 | awk '{print $'$i'}'`
	while [ "$colum" != "" ]
	do
		if [ "AS" == `sed -n '2p' $1 | awk '{print $'$j'}'` ] #ASがある場合
		then
			i=`expr $i + 2`
			ARRAY+=(`sed -n '2p' $1 | awk '{print $'$i'}' | sed 's/,//'`)
			let i++
			j=`expr $j + 3`
		else
			ARRAY+=(`echo $colum | sed 's/,//'`)
			let i++
			let j++
		fi
		colum=`sed -n '2p' $1 | awk '{print $'$i'}'`
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
		COLUM+=("$colum")
		read -p "ORDER BYに指定する項目を優先度が高いものから選んでください[終了:q]：" colum
	done
	if [ 0 -eq "${#COLUM[@]}" ]
	then
		echo "ORDER指定なし、終了します。"
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
		i=`expr $i + 2`
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

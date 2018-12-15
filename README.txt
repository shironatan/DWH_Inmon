##これ
DWHをInmonモデルで構築する&&構築時間測定&&クエリ実行時間測定&&DBサイズ測定　できます。

##確認済動作環境
OS : Ubuntu 18.04.1 LTS
MYSQL : MYSQL 5.7.24-0ubuntu0.18.04.1

##使い方
$ sudo git clone https://github.com/shironatan/DWH_Inmon

１．DB構築と構築時間を測定
$ pwd
 ...../DWH_Inmon/Inmon
$ cd CreateDir
$ sudo ./Main.sh
 DWHをInmonモデルで構築...
 my.cnfファイルを新規作成rm 
 UserName : MYSQLのユーザアカウントを入力
 Password : 対応するパスワードを入力
 HostName : ホスト名を入力(localhostなど)
 ..

２．各クエリの実行時間を測定
$ pwd
 ...../DWH_Inmon/Inmon
$ cd Query
$ sudo ./Query.sh
 SQLファイル名 : ファイル名を入力(1.sqlなど)
 ユーザーを新規作成・変更
 ユーザー名 : MYSQLのユーザアカウントを入力
 パスワード : 対応するパスワードを入力
 ホスト名 : ホスト名を入力(localhostなど)
 変更完了
 /* ログインユーザー */
 hoge
 ユーザー名を指定[変更:change] : hoge
 ..
 
３．各DBのサイズを測定
$ pwd
 ...../DWH_Inmon/Inmon
$ cd Size
$ sudo ./Size.sh
 my.cnfファイルを新規作成
 UserName : MYSQLのユーザアカウントを入力
 Password : 対応するパスワードを入力
 HostName : ホスト名を入力(localhostなど)
 ..


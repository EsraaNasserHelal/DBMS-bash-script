#!/bin/bash

function db_valid(){
read -p "please enter the desired database name: " db_name
if [[ $db_name =~ ^[A-Za-z]+[A-Za-z0-9/] ]]
then
export db_name
else
echo "not valid "
fi
}

db_valid

function db_exist(){

if [ -d ./dbe/$db_name ]

then
cd ./dbe/$db_name
echo "connected succesfully"

while true
do
echo "1) create table"
echo "2) list tables"
echo "3) drop table"
echo "4) select"
echo "5) insert"
echo "6) delet from table"
echo "7) update"
echo "8) disconnect"

read choice

case $choice in
1) ../../create_table.sh ;;
2) ../../listtable.sh ;;
3) ../../droptable.sh ;;
4) ../../select.sh ;;
5) ../../insert.sh ;;
6) ../../delete.sh ;;
7) ../../update.sh ;;
8) ../../disconnect.sh; exit ;;

*) echo "not a valid choice try again" ;;
esac
done


else
echo "sorry the name you entered wasn't found"
fi
}
db_exist

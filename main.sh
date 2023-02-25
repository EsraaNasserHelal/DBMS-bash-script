#!/bin/bash

if [ -d ./dbe ]
then
while true
do 
echo "1) creat database"
echo "2) list database"
echo "3) connect"
echo "4) drop"
echo "5) exit"

read choice

case $choice in
1) ./creatdb.sh ;;
2) ./list.sh ;;
3) ./connect.sh ;;
4) ./dropdb.sh ;;
5) echo "thank you for using our product :)"; exit ;;
*) echo "not a valid choice try again" ;;
esac
done
else
mkdir ./dbe
fi

#!/bin/bash

function db_valid(){

read -p "please enter the database name: " db_name
if [[ $db_name =~ ^[A-Za-z]+[A-Za-z0-9/] ]]
then
export db_name
else
echo "not valid "
exit
fi
}

db_valid


function create(){
mkdir ./dbe/$db_name
}

function db_exist(){

if [ -d ./dbe/$db_name ]
then

echo "sorry the name you entered already exist"

exit
else
create

fi
}
db_exist

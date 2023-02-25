#!/bin/bash

function table_valid(){

read -p "please enter the desired table name: " table_name
if [[ $table_name =~ ^[A-Za-z]+[A-Za-z0-9/] ]]
then
export table_name
else
echo "not valid "
fi
}

table_valid


function metadata(){
typeset -i fileds
read -p "insert the number of feilds please " fields

echo "$fields" >> ./$table_name"metadata"
let y=$fields-1
read -p "insert the name of the first field " f1
for i in $(seq 1 $y)
do
read -p "insert the name of the next field " input1
echo -n "$input1" >> ./$table_name"metadata"
echo -n " " >> ./$table_name"metadata"

done
echo "pk type is set as integer choose the datatype for the rest"
echo " " >> ./$table_name"metadata"
for i in $(seq 1 $y)
do
read -p "insert the datatype " input2
echo -n "$input2" >> ./$table_name"metadata"
echo -n " " >> ./$table_name"metadata"

done
echo  " " >> ./$table_name"metadata"


}

function create(){
touch ./$table_name
touch ./$table_name"metadata"
metadata
}



function table_exist(){

if [ -f ./$table_name ]
then

echo "sorry the name you entered already exist"

else
create
                                                                     
fi
}
table_exist

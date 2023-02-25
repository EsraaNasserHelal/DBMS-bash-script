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

function inserting(){
typeset -i fields
fields="$(head -1 ./$table_name"metadata" | cut -d ' ' -f 1 )"
let y=$fields-1
read -p "insert the value of the pk " pk
present="$(cut -d ' ' -f 1 ./$table_name | grep "$pk" )"
if [ ${#present} == 0 ]
then
if [[ $pk =~ ^[0-9]*[0-9] ]]
then
echo -n "$pk" >> ./$table_name 
echo -n " " >> ./$table_name

else 
echo "invalid pk"
exit
fi
else 
echo "primary key already exist"
exit
fi


for i in $(seq 1 $y)
do
read -p "insert the next field " input
dtype="$(head -3 ./$table_name"metadata" | cut -d ' ' -f $i | tail -1)"

if [[ ( $dtype == "int" && $input =~ ^[0-9]*[0-9] )  || $dtype == "string" ]]
then
echo -n "$input" >> ./$table_name 
echo -n " " >> ./$table_name 
else 
echo "datatype in incorrect"
exit
fi 
done

echo  " " >> ./$table_name

}

function table_exist(){

if [ -f ./$table_name  ]
then
inserting

else
echo "sorry the name you entered wasn't found"
fi

}

table_exist

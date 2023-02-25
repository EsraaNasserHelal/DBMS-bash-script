#! /bin/bash
function delete(){
  read -p  "enter table name: " table_name
  if ! [ -f $table_name ]
  then
  echo "table not found"
  exit;
  else
  read -p "enter col name: " col_name

  testcol=$(awk '{if(NR==2){for(i=1;i<=NF;i++){if($i=="'$col_name'")print i+1}}}' ./$table_name"metadata")
  #btl3 el col dah rakm kam
  echo $testcol
  if [[ $testcol == "" ]];then
  echo "column not found"
  else
  read -p "enter pk" pk

  checkpk=$(awk '{if($1=='$pk') print NR }' ./$table_name )
  echo "$checkpk"
  sed -i "${checkpk}d" ./$table_name
  fi
  fi
}
delete;

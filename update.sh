#! /bin/bash
function update(){

 read -p  "enter table name: " table_name
 if ! [ -f $table_name ]
 then
 echo "table not found"
 exit;
 else                                
 read -p "enter col name: " col_name
     
 testcol=$(awk '{if(NR==2){for(i=1;i<=NF;i++){if($i=="'$col_name'")print i+1}}}' ./$table_name"metadata")

 if [[ $testcol == "" ]];then
 echo "column not found"
 else
 read -p "enter pk " pk
 checkpk=$(awk '{if($1=='$pk') print NR }' ./$table_name )
  
 if [[ $checkpk == "" ]]; then
 echo "this pk is not found"

 else

 read -p "enter newvalue: " newvalue
 prevvalue=$(awk  '{if(NR=='$checkpk') print $'$testcol'}' ./$table_name )
 sed -i "${checkpk}s/$prevvalue/$newvalue/" ./$table_name
                                                                	
 fi
 fi
 fi

exit;
      
}
update;       
         
    

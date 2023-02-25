#! /bin/bash
 function select_from_table(){
     #read select_menu
     select select_menu in " select all" " select col" " select row"
     do
     case $select_menu in
     " select all") read -p  "enter table name:" table_name
     if ! [ -f $table_name ]
     then
     echo "table not found"
     exit;
     else
     cat $table_name
     fi
     exit;
      ;;
      ###############################################################
     " select col") 	 
     read -p  "enter table name: " table_name
     if ! [ -f $table_name ]
     then
     echo "table not found"
     exit;
     else                                
     read -p "enter col name: " col_name
     typeset -i testcol
    testcol=$(awk '{if(NR==2){for(i=1;i<=NF;i++){if($i=="'$col_name'")print i+1}}}' ./$table_name"metadata")

    if [[ $testcol == "" ]];then
    echo "column not found"
    else
    cat $table_name | cut -d ' ' -f $testcol


	fi
        exit;
        fi
        exit;;
      ################################################################  
        
     " select row")  read -p  "enter table name: " table_name
     if ! [ -f $table_name ]
     then
     echo "table not found"
     exit;
     else                                
     read -p "enter pk" pk
    checkpk=$(awk '{if($1=='$pk') print NR }' ./$table_name )
    echo "$checkpk"
    sed -n "${checkpk}p" ./$table_name
    fi
    exit;
    ;;
        #################################################################
     *) echo "wrong choice"
     exit;
     ;;
      esac
      done
 }
 select_from_table;
 
 

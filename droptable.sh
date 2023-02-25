#drop table contents and delete the table
#step 1) check if the table exists or not
#step 2) if it not exist >> "this table not find"
#step3) if it exists >> rm the file 
#!/usr/bin/bash
function droptable(){
   echo "Enter the name of table you want to delete"
   read table_name
    
    if
    ! [ -f $table_name ] ;
    then
    echo  "sorry this table doesn't exist "
    exit
    read
    
    else
    rm "$table_name"
    rm $table_name"metadata" 
    echo  "the table $table_name is deleted"
     
    
    fi
}
droptable;

#!/bin/bash

validate_name() {
    if [[ $1 =~ ^[A-Za-z] ]]; then
        return 0
    else
        return 1
    fi
}

create_database() {
    read -p "Enter Database Name: " dbname

    if ! validate_name "$dbname"
    then
        echo "Invalid Database Name"
        return
    fi

    if [ -d "Databases/$dbname" ]
    then
        echo "Error: Database already exists"
        return
    fi

    mkdir -p "Databases/$dbname"

    echo "Database created successfully"
}

delete_database() {
    read -p "Enter Database Name: " dbname

    if [ ! -d "Databases/$dbname" ]
    then
        echo "Error: Database does not exist"
        return
    fi

    rm -r "Databases/$dbname"

    echo "Database deleted successfully"
}

create_table() {
    read -p "Enter Database Name: " dbname

    if [ ! -d "Databases/$dbname" ]
    then
        echo "Error: Database does not exist"
        return
    fi

    read -p "Enter Table Name: " tablename

    if ! validate_name "$tablename"
    then
        echo "Invalid Table Name"
        return
    fi

    if [ -f "Databases/$dbname/$tablename" ]
    then
        echo "Error: Table already exists"
        return
    fi

    touch "Databases/$dbname/$tablename"

    echo "Table created successfully"
}

delete_table() {
    read -p "Enter Database Name: " dbname

    if [ ! -d "Databases/$dbname" ]
    then
        echo "Error: Database does not exist"
        return
    fi

    read -p "Enter Table Name: " tablename

    if [ ! -f "Databases/$dbname/$tablename" ]
    then
        echo "Error: Table does not exist"
        return
    fi

    rm "Databases/$dbname/$tablename"

    echo "Table deleted successfully"
}

insert_row() {
    read -p "Enter Table Name: " tablename

    if [ ! -f "Databases/$dbname/$tablename" ]
    then
        echo "Error: Table does not exist"
        return
    fi

    read -p "Enter ID: " id

    if grep -q "^$id|" "Databases/$dbname/$tablename"
    then
        echo "Error: ID already exists"
        return
    fi

    read -p "Enter Name: " name
    read -p "Enter Phone: " phone

    echo "$id|$name|$phone" >> "Databases/$dbname/$tablename"

    echo "Row inserted successfully"
}

select_data() {
    read -p "Enter Table Name: " tablename

    if [ ! -f "Databases/$dbname/$tablename" ]
    then
        echo "Error: Table does not exist"
        return
    fi

    echo " $tablename "
    echo "ID | Name | Phone"

    awk -F'|' '{print $1 " | " $2 " | " $3}' "Databases/$dbname/$tablename"
}

delete_row() {
    read -p "Enter Table Name: " tablename

    if [ ! -f "Databases/$dbname/$tablename" ]
    then
        echo "Error: Table does not exist"
        return
    fi

    read -p "Enter ID to delete: " id

    if ! grep -q "^$id|" "Databases/$dbname/$tablename"
    then
        echo "Error: ID does not exist"
        return
    fi

    sed -i "/^$id|/d" "Databases/$dbname/$tablename"

    echo "Row deleted successfully"
}



connect_database() {
    read -p "Enter Database Name: " dbname

    if [ ! -d "Databases/$dbname" ]
    then
        echo "Error: Database does not exist"
        return
    fi

    echo "Connected to database: $dbname"

    while true
    do
        echo " $dbname "
        echo "1. Insert Row"
        echo "2. Select Data"
        echo "3. Delete Row"
        echo "4. Exit"

        read -p "Choose: " choice

        case $choice in
            1) insert_row ;;
            2) select_data ;;
            3) delete_row ;;
            4) break ;;
            *) echo "Invalid Choice" ;;
        esac
    done
}


while true
do
    echo "DB "
    echo "1. Create Database"
    echo "2. Delete Database"
    echo "3. Create Table"
    echo "4. Delete Table"
    echo "5. Connect Database"
    echo "6. Exit"

    read -p "Choose: " choice

    case $choice in
        1) create_database ;;
        2) delete_database ;;
        3) create_table ;;
        4) delete_table ;;
        5) connect_database ;;
        6) exit ;;
        *) echo "Invalid Choice" ;;
    esac
done

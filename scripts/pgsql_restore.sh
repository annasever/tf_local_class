#!/bin/bash

#change on your path to PostgreSQL
#pathA=/c/Program\ Files/PostgreSQL/13/bin
#export PATH=$PATH:$pathA

#write your password
#PGPASSWORD=root
#export PGPASSWORD

#change the path to the file from which will be made restore
#pathB=backup/
#write this on the command line as the first parameter
#filename=$1
#write your user
#dbUser=user
#write your database
#database=database
#write your host
#host=postgres
#write your port
#port=5432

#psql -U $dbUser -h $host -p $port -d $database -c "DROP SCHEMA public CASCADE; CREATE SCHEMA public;"
#psql --set ON_ERROR_STOP=off -U $dbUser -h $host -p $port -d $database -1 -f $pathB$filename

#unset PGPASSWORD

#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <db_container_name> <dump_file>"
    exit 1
fi

DB_CONTAINER_NAME=$1
DUMP_FILE=$2

if [ -z "$POSTGRES_DB" ] || [ -z "$POSTGRES_USER" ] || [ -z "$POSTGRES_PASSWORD" ]; then
    echo "Error: One or more required environment variables are not set."
    echo "Please set the following environment variables: POSTGRES_DB, POSTGRES_USER, POSTGRES_PASSWORD"
    exit 1
fi

if [ ! -f "$DUMP_FILE" ]; then
    echo "Dump file $DUMP_FILE not found!"
    exit 1
fi

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <CONTAINER_PATH> <DB_DUMP_PATH>"
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

# Wait for PostgreSQL to be ready
#until docker exec "$DB_CONTAINER_NAME" pg_isready -U "$POSTGRES_USER"; do
#    echo "Waiting for PostgreSQL..."
#    sleep 2
#done

# Restore the database dump
#docker exec "$DB_CONTAINER_NAME" pg_restore -U "$POSTGRES_USER" -d "$POSTGRES_DB" "$DUMP_FILE"

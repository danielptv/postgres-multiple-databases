#!/bin/bash

set -e
set -u

function create_user_and_database() {
    local dbinfo=$1
    IFS=":" read -r database user password <<<"$dbinfo"
    echo "Creating database '$database' with user '$user'."

    userExists=$(psql -v ON_ERROR_STOP=1 -U "$POSTGRES_USER" -d "$POSTGRES_DB" -c "SELECT 1 FROM pg_user WHERE usename = '$user';")
    if [[ "$userExists" == *"(0 rows)"* ]]; then
        psql -v ON_ERROR_STOP=1 -U "$POSTGRES_USER" -d "$POSTGRES_DB" <<-EOSQL
            CREATE USER "$user";
            ALTER USER "$user" WITH ENCRYPTED PASSWORD '$password';
EOSQL
    fi

    psql -v ON_ERROR_STOP=1 -U "$POSTGRES_USER" -d "$POSTGRES_DB" <<-EOSQL
      CREATE DATABASE "$database";
      GRANT ALL PRIVILEGES ON DATABASE "$database" TO "$user";
EOSQL
}

if [ -n "$POSTGRES_MULTIPLE_DATABASES" ]; then
    echo "Multiple database creation requested."
    for entry in $(echo "$POSTGRES_MULTIPLE_DATABASES" | tr ',' ' '); do
        entry=$(echo "$entry" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')

        num_colons=$(grep -o ":" <<<"$entry" | wc -l)

        if [ "$num_colons" -eq 0 ]; then
            entry="$entry:$POSTGRES_USER:$POSTGRES_PASSWORD"
        elif [ "$num_colons" -eq 1 ]; then
            entry="$entry:$POSTGRES_PASSWORD"
        fi
        create_user_and_database "$entry"
    done
    echo "Multiple databases created."
fi

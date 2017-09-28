#!/bin/bash

set -e
cmd="$@"


until PGPASSWORD="${PRODUCTION_DB_PASSWORD}" psql -d "${PRODUCTION_DB_NAME}" -h "${PRODUCTION_DB_HOST}" -U "${PRODUCTION_DB_USERNAME}" -c '\l'; do
  >&2 echo "Postgres is unavailable - sleeping"
  sleep 1
done

>&2 echo "Postgres is up - executing command"

# Running Migrations and Seeds
rake db:migrate
rake db:seed

# Running Unicorn Process In case of successful DB connection
exec $cmd


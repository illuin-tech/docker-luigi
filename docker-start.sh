#!/usr/bin/env bash
set -e

function wait_for_it {
    HOST=$1
    PORT=$2
    TIMEOUT=$3
    until wait-for-it --host=${HOST} --port=${PORT} --timeout=${TIMEOUT} --quiet; do
        >&2 echo "Connection not available on ${HOST}:${PORT} - waiting ${TIMEOUT} seconds"
    done
    echo "Connection is available on ${HOST}:${PORT}."
}

if (echo ${luigi_database_url} | grep -Eq ^.+\:\/\/.+\:.+\@.+\:[0-9]+\/.*$); then
    # DATABASE_URI is in prot://user:pass@host:port/db format
    HOST=$(echo ${luigi_database_url} | cut -d@ -f2 | cut -d/ -f1 | cut -d: -f1)
    PORT=$(echo ${luigi_database_url} | cut -d@ -f2 | cut -d/ -f1 | cut -d: -f2)
    TIMEOUT=5

    wait_for_it ${HOST} ${PORT} ${TIMEOUT}
fi

echo "Starting luigi"
luigid

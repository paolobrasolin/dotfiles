#!/usr/bin/env bash

DB=${1:-db-c25}
PORT=${2:-10864}

echo "Opened tunnel on port $PORT to $DB through websocket..."
ssh -N -L localhost:$PORT:/var/run/postgresql/.s.PGSQL.5432 $DB
echo "Closed!"


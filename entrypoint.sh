#!/bin/bash
set -eo pipefail
shopt -s nullglob

# if command starts with an option, prepend rethinkdb
if [ "${1:0:1}" = '-' ]; then
	set -- rethinkdb --no-update-check $@
fi

if [ "$1" = 'admin' ]; then
  # Check whether a server is online
  getent hosts tasks.rethinkdb_server || (echo "[Error] No servers found!" && exit 1)

  set -- rethinkdb proxy --bind all --no-update-check --initial-password $RETHINKDB_PASSWORD --join tasks.rethinkdb_server
fi

if [ "$1" = 'default' ]; then
	set -- rethinkdb --bind all --no-update-check --no-http-admin --initial-password $RETHINKDB_PASSWORD

	# Check whether there are other servers to join
	getent hosts tasks.rethinkdb_server && set -- rethinkdb --bind all --no-update-check --no-http-admin --initial-password $RETHINKDB_PASSWORD --join tasks.rethinkdb_server
fi

exec "$@"

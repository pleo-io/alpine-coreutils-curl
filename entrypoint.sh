#!/bin/sh
set -e

if ! type -- "$1" &> /dev/null; then
	set -- curl "$@"
fi

exec "$@"
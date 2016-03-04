#!/bin/bash

if [ $# -eq 0 ]; then
	echo 'command script required'
	exit 1
fi

COMMAND=$1
shift

C="collect.sh"

if [ -f "$C" ]; then
	. ./"$C"
else
	echo "$C is required."
	exit 1
fi

for SERVER in ${SERVER_LIST}; do
	bash $COMMAND $SERVER
done

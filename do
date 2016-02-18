#!/bin/bash
# Author: Manh Thiep <manhthiep@gmail.com>

DOFILE="Dofile"
COMMAND=

if [ -f ${DOFILE} ]; then
	source ${DOFILE}
fi

print_help() {
	echo "Usage: $0 <COMMAND> [ARGS]"
	echo ""
	echo "COMMAND - command (function) defined in ${DOFILE}"
	echo "ARGS    - arguments for command"
	echo ""
	echo "Available commands:"
	echo ""
	compgen -A function
	echo ""
}

view_command() {
	declare -f $1
}

if [ $# -lt 1 ]; then
    print_help
    exit -1
fi

COMMAND=$1

eval ${COMMAND} ${@:2}

exit 0
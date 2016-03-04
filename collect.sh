#!/bin/bash

SERVER_LIST=
DEFAULT_SLF='server.list'

collect() {
	while [ $# -gt 0 ]; do
		if [ $1 != '-f' ]; then
			SERVER_LIST="${SERVER_LIST} $1"
			shift
		else
			shift
			if [ $# -gt 0 ]; then
				SLF=$1
				if [ -f $SLF ]; then
					while read line; do
						SERVER_LIST="${SERVER_LIST} $line"
					done < $SLF
				fi
				shift
			fi
		fi
	done
}

# if [ -f ${DEFAULT_SLF} ]; then
# 	collect $@ -f ${DEFAULT_SLF}
# else
	collect $@
# fi


# echo ${SERVER_LIST}
# exit 0
# 
# if [ $? -eq 0 ]; then
# 	echo 'collect succeeded'
# else
# 	echo 'collect failed'
# fi

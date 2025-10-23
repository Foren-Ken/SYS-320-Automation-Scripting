#!/bin/bash

[[ $#<1 ]] && echo "Usage: $0 <Prefix>" && exit 2

if [[ ${#1} < 5 ]]
	then printf "Prefix length is too short\nPrefix example: 10.0.17\n"
	exit 1
fi


for ip in $(seq 1 255);
do
	full="$1.$ip"
	if ping -c 1 -W 1 $full > /dev/null;
		then echo $full
	fi
done

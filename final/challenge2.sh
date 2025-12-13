#!/bin/bash
ioc_location=$2
logFile=$1
sus_logs=""
cut_logs=""
log=""

ioc_list=($(<$ioc_location))



for (( x=0; x<${#ioc_list[@]}; x++ ))
do
	# echo "${ioc_list[$x]}"
	sus_logs+=$(grep "${ioc_list[$x]}" "$logFile")
	sus_logs+=$'\n'
done
# echo "$sus_logs"

cut_logs=$(echo "$sus_logs" | cut -d ' ' -f 1,4,7 | sed -e 's@\[@@' | sort |uniq)
echo "$cut_logs" | sed '/^$/d' > report.txt

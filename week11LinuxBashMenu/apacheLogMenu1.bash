#! /bin/bash

logFile="/var/log/apache2/access.log.1"

function displayAllLogs(){
	cat "$logFile"
}

function displayOnlyIPs(){
        cat "$logFile" | cut -d ' ' -f 1 | sort -n | uniq -c
}

function displayOnlyPages(){
# like displayOnlyIPs - but only pages
	cat "$logFile" | cut -d ' ' -f 7 | grep -v "408" | sort -n | uniq -c
}

function histogram(){

	local visitsPerDay=$(cat "$logFile" | cut -d " " -f 4,1 | tr -d '['  | sort \
                              | uniq)
	# This is for debugging, print here to see what it does to continue:
	# echo "$visitsPerDay"

        :> newtemp.txt  # what :> does is in slides
	echo "$visitsPerDay" | while read -r line;
	do
		local withoutHours=$(echo "$line" | cut -d " " -f 2 \
                                     | cut -d ":" -f 1)
		local IP=$(echo "$line" | cut -d  " " -f 1)
          
		local newLine="$IP $withoutHours"
		echo "$IP $withoutHours" >> newtemp.txt
	done 
	cat "newtemp.txt" | sort -n | uniq -c
}

function fVisitors(){ 
# Only display the IPs that have more than 10 visits
# You can either call histogram and process the results,
# Or make a whole new function. Do not forget to separate the 
# number and check with a condition whether it is greater than 10
# the output should be almost identical to histogram
# only with daily number of visits that are greater than 10 
	local skibidiVisitors=($(cat "$logFile" | cut -d ' ' -f1 | sort | uniq -c ))

	local megaskibidi=${#skibidiVisitors[@]}
	local int test=10

	for (( i=0; i<=(( $megaskibidi-1 )); i+=2 ));
	do 
	# echo "$i"
	local x=$(( $i+1 ))

	if [[ ${skibidiVisitors[$i]} -gt 10 ]]; then
	echo -e ${skibidiVisitors[$i]} ${skibidiVisitors[$x]} "\n"

	fi

	done


}
function susVis(){
local ioc_location="./ioc.txt"
local sus_logs=""
local cut_logs=""
local log=""
# Manually make a list of indicators of attack (ioc.txt)
# filter the records with this indicators of attack
# only display the unique count of IP addresses.  
# Hint: there are examples in slides

# Keep in mind that I have selected long way of doing things to 
# demonstrate loops, functions, etc. If you can do things simpler,
# it is welcomed.
local ioc_list=($(<$ioc_location))
echo -e "The following are the currently checked-for IOCs: \n ${ioc_list[@]}"
cut_logs=($(cat "$logFile" | cut -d ' ' -f 1,7))

for (( x=0; x<${#ioc_list[@]}; x++ ))
do

	for (( i=1; i<(${#cut_logs[@]}); i+=2 ))
	do
		#echo "Im IOC ${ioc_list[x]} $x"
		#echo "Im URL ${cut_logs[i]} $i"

		if [[ ${cut_logs[i]} =~ "${ioc_list[x]}" ]]; then
		sus_logs+="${cut_logs[i-1]} \n" #${cut_logs[i]}"
		fi

	done
done
#echo -e $sus_logs
local result=$(echo -e $sus_logs | grep " " | sort | uniq -c)
echo "$result"
}

while :
do
	echo "Please select an option:"
	echo "[1] Display all Logs"
	echo "[2] Display only IPS"
	echo "[3] Display only pages visited"
	echo "[4] Histogram"
	echo "[5] Frequent visitors"
	echo "[6] Suspicious visitors"
	echo "[7] Quit"

	read userInput
	echo ""

	if [[ "$userInput" == "7" ]]; then
		echo "Goodbye"		
		break

	elif [[ "$userInput" == "1" ]]; then
		echo "Displaying all logs:"
		displayAllLogs

	elif [[ "$userInput" == "2" ]]; then
		echo "Displaying only IPS:"
		displayOnlyIPs

	elif [[ "$userInput" == "3" ]]; then
		echo "Displaying only pages:"
		displayOnlyPages

	# Display only pages visited

	elif [[ "$userInput" == "4" ]]; then
		echo "Histogram:"
		histogram

	elif [[ "$userInput" == "5" ]]; then
		echo "freq visitors"
		fVisitors

	elif [[ "$userInput" == "6" ]]; then
		echo "sus visitors"
		susVis	

       	# Display suspicious visitors
	# Display a message, if an invalid input is given
	fi
done


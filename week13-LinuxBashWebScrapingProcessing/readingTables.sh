#!/bin/bash

link="10.0.17.6/Assignment.html"
alldata=""

for i in {1..2}; do
fP=$(curl -sL "$link")
	toolOutput=$(echo "$fP" | xmlstarlet format --html --recover 2>/dev/null | \
	xmlstarlet select --template --copy-of "//html//body//table[$i]//tr")
	# echo "$toolOutput"

alldata=$(echo "$toolOutput" | sed 's/<\/tr>/\n/g' | \
                     sed -e 's/&amp;//g' | \
                     sed -e 's/<tr>//g' | \
		     sed -e 's/&#13;//g'| \
                     sed -e 's/<td[^>]*>//g' | \
                     sed -e 's/<\/td>/;/g' | \
		     sed '1,3d' | \
		     sed -e 's/^[[:space:]]*//g' | \
                     sed -e '/^$/d' | \
		     sed -e 's/;$//' | \
		     sed -e 's/<[/\]\{0,1\}a[^>]*>//g' | \
                     sed -e 's/<[/\]\{0,1\}nobr>//g')

if [[ $i == 1 ]]; then
	alldata1=$alldata 
else
	alldata2=$alldata

fi
done

noLines=$(echo "$alldata1" | wc -l)

for ((n=1; n<=noLines; n++)); do
    if (( n % 2 != 1 )); then  # odd checker
        continue
    fi
    part1=$(echo "$alldata2" | sed -n "${n}p")
    part2=$(echo "$alldata1" | sed -n "${n}p")
    part3=$(echo "$alldata2" | sed -n "$((n+1))p")

   echo "$part1 $part2 $part3"
done

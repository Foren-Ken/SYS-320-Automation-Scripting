#!/bin/bash

link="10.0.17.6/IOC.html"
fP=$(curl -sL "$link")
	toolOutput=$(echo "$fP" | xmlstarlet format --html --recover 2>/dev/null | \
	xmlstarlet select --template --copy-of "//html//body//tr//td[1]")
output=$(echo "$toolOutput" | sed -e 's@</td>@\n@g' | sed -e 's@<td>@@g' | \
	sed -e '/^$/d')


echo "$output" > IOC.txt

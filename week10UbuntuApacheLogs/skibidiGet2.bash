#!/bin/bash
file="/var/log/apache2/access.log"

function getTheLogs(){
cat "$file" | cut -d ' ' -f7 | sort | uniq -c

}
getTheLogs

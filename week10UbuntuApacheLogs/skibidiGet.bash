#!bin/bash
logTotal=""
file="/var/log/apache2/access.log.1"

function getTheLogs(){
logTotal=$(cat "$file")
}

function ips(){
ipList=$(echo "$logTotal" | cut -d ' ' -f1)
}

function pageCount(){
sorted=$(echo "$logTotal" | cut -d ' ' -f7 | sort | uniq -c )
}

function countingCurlAccess(){
curlSorted=$(echo "$logTotal" | grep "curl/"| cut -d ' ' -f1,12 | sort | uniq -c)


}

getTheLogs
ips
pageCount
countingCurlAccess
echo "$curlSorted"

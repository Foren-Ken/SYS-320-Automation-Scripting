#!/bin/bash

tempStart=$(cat << 'EOF'

<html><head>
	<title>IOC Indicators</title>
	<style>
	  table, th, td {
		border: 1px solid black;
	  }
	</style>
</head>

<body>
<br><br> Access logs with IOC indicators: <br><br>
<table id="ioc">
	<tbody><tr>
		<th>IP Address</th>
		<th>Date-Time</th>
		<th>URI Accessed</th>
	</tr>

EOF
)

tempEnd=$(cat << 'EOF'

</tbody></table>


</body></html>
EOF
)

echo "$tempStart" > report.html

tL=$(wc -l < $1)
# echo "$tL"

for ((i=1; i<=tL; i++)); do
	line=$(sed -n "${i}p" $1)
	ip=$(echo "$line" | awk '{print $1}')
	date=$(echo "$line" | awk '{print $2}')
	uri=$(echo "$line" | awk '{print $3}')
	echo "<tr>" >> report.html
	echo "<td>$ip</td>" >> report.html
 	echo "<td>$date</td>" >> report.html
    	echo "<td>$uri</td>" >> report.html
    	echo "</tr>" >> report.html


done

echo "$tempEnd" >> report.html



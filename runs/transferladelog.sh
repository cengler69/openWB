#!/bin/bash
if [ -e /var/www/html/openWB/web/ladelog ]; then
	oldlog="/var/www/html/openWB/web/ladelog"
	while IFS= read -r line
	do
		  #echo "$line"
		year=$(echo $line | cut -c 7-8 )
		month=$(echo $line | cut -c 4-5 )
		if [[ $year == "19" ]] ||  [[ $year == "20" ]]; then
			echo $line >> /var/www/html/openWB/web/logging/data/ladelog/20$year$month.csv 
		fi
	  done < "$oldlog"
	  rm /var/www/html/openWB/web/ladelog
fi

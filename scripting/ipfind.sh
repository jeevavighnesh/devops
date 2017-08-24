#!/bin/bash

#To find the ip address for a given Device name
ipmask=""
declare -l MAC=""
ip_get_time=$SECONDS
p=$1
count=$(echo $p | wc -w)
echo $((++count))
MAC=$(cat ~/Documents/macs | grep "$p" | awk -v c="$count" '{print $c}')
#for(( i=1; i<4; i++ ))
do
	if [[ $i -ne 3 ]]
	then
		ipmask=$ipmask$(ifconfig | grep -A 2 wlx | grep broadcast | awk '{print $6}'| cut -d '.' -f $i)"."
	else
		ipmask=$ipmask$(ifconfig | grep -A 2 wlx | grep broadcast | awk '{print $6}'| cut -d '.' -f $i)".*"
	fi
done

nmap -sP $ipmask >> /dev/null
ip_get_time=$SECONDS

arp -an | grep $MAC | awk '{print $2}' | cut -d '(' -f 2 | cut -d ')' -f 1

echo "It took $(echo $ip_get_tim)sec to get the ip"


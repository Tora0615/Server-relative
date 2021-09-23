#!/bin/bash

target="google.com"

count=$( ping -c 1 $target | grep icmp* | wc -l )

if [ $count -eq 0 ] ; then
	/sbin/shutdown -r +0
	#echo "loss connect"
fi

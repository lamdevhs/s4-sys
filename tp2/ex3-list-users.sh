#!/bin/bash

IFS=$'\n'
for line in $(cat /etc/passwd); do
	uid=$(echo $line | cut -f3 -d:)
	if [ "$uid" -ge 500 ] ; then
		echo -n "$uid: "
		echo $line | cut -f1 -d:
	fi
done
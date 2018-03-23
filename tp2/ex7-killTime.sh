#!/bin/bash

isNumber() {
	[ "$1" != "" ] && [ $(($1 * 1)) -ne 0 ] || [ "$1" = 0 ]
}

#pkill xclock

for file in /proc/* ; do
	base=$(basename "$file")
	if [ -d "$file" ] && $(isNumber $base) ;
	then
		name=$(head -n1 "$file/status" | cut -f2 -d$'\t' )
		if [ "$name" = xclock ] ; then
			echo "pid = $base, nom = $name -- killed"
			kill -9 $base
		fi
	fi
done
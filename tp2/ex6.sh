#!/bin/bash

check() {
	echo $?
}

isNumber() {
	[ "$1" != "" ] && [ $(($1 * 1)) -ne 0 ] || [ "$1" = 0 ]
}

cond() {
	[ "$1" = 0 ]
}

inRange() {
	[ $1 -ge $2 ] && [ $1 -le $3 ]
}

inf=$1
sup=$2
condition=$([ $# -ge 2 ] ; echo $?)

for file in /proc/* ; do
	base=$(basename "$file")
	if [ -d "$file" ] && $(isNumber $base) ;
	then
		if ! $(cond $condition) || $(inRange $base $inf $sup) ;
		then
			name=$(head -n1 "$file/status" | cut -f2 -d$'\t' )
			echo "pid = $base, nom = $name"
		fi
	fi
done
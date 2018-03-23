#!/bin/bash

WHERE="$1"

sep () { echo "--------"; }

sep
echo Les fichiers de "$WHERE" sont :
for file in "$WHERE"/* ; do
	if [ -f "$file" ] ; then
		echo $file
	fi
done

sep
echo Les répertoires de "$WHERE" sont :
for file in "$WHERE"/* ; do
	if [ -d "$file" ] ; then
		echo $file
	fi
done

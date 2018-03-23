#!/bin/bash

FILE=$1

echo -n "$FILE est un "
if [ -d "$FILE" ] ; then
	echo -n "répertoire "
else
	echo -n "fichier ordinaire "
fi

if [ -r "$FILE" ] ; then
	echo -n "lisible "
fi

if [ -w "$FILE" ] ; then
	echo -n "modifiable "
fi

if [ -x "$FILE" ] ; then
	echo -n "exécutable "
fi

echo "par $USER."
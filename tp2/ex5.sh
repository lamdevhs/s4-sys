#!/bin/bash



mkRandTxt() {
	touch $RANDOM.txt
}

isTxt() {
	[ -f "$1" ] && [ "${1##*.}" = "txt" ]
}

isNumber() {
	[ "$1" != "" ] && [ $(($1 * 1)) -ne 0 ] || [ "$1" = 0 ]
}

create() {
	N="$2"
	if ! $(isNumber $N) ; then
		N=42
	fi
	echo "creating $N random files."
	for i in $(seq 1 1 $N) ; do
		mkRandTxt
	done
}

delete() {
	cpt=0
	for file in "$PWD"/* ; do
		filename=$(basename "$file")
		if $(isTxt "$filename") && $(isNumber ${filename%.*}) ; then
			#echo $filename
			rm $filename
			cpt=$((cpt + 1))
		fi
	done
	echo "deleted $cpt txt files."
}

case "$1" in
	-c) create ;;
	-s) delete ;;
	*) echo "commande non reconnue" ; exit 1 ;;
esac
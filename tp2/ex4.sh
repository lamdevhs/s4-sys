#!/bin/bash


isTxt() {
	[ -f "$1" ] && [ "${1##*.}" = "txt" ]
}

WHERE="$1"

for file in "$WHERE"/* ; do
	if $(isTxt "$file") ; then
		echo "Voulez-vous afficher \""$file"\" ?"
		read answer
		case "$answer" in
			y|Y|yes|oui|o|O)
				more "$file" ;;
		esac
	fi
done
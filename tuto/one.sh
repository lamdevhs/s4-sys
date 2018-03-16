#!/bin/bash

var='ceci est une var'

echo $var

echo 'bonjour, ' $var

echo this var does not exist: $foo

X=22
export X
export Y=44

n=1
echo $(( n + 1 ))

p=$(( n * 5 / 2 ))
echo $p $(( 1 % 2 ))

path=foo/bar/blah
echo path=$path

DIR=`dirname $path`
echo $DIR
dirname $path/

basename $path
basename $path/

Files=$(ls /etc | grep sh$ )
echo $Files

Foo='hello hello world world'

echo ${Foo#*hello }
echo ${Foo##*hello }

echo ${Foo% world*}
echo ${Foo%% world*}

if [ "${1##*.}" == "tar" ] ; then
	echo $1 est une archive tar
else
	echo $1 "n'est pas une archive tar"
fi

c=0
echo param $c: $0
c=$(($c+1))
for i in $*
do
	echo param $c: $i
	c=$(($c+1))
done




testType() {
	echo -n "file '$1' "
	if [ ! -e "$1" ] ; then
		echo "does not exit"
		return 1
	fi

	if [ -d "$1" ] ; then
		echo "is a directory"
	elif [ -L "$1" ] ; then
		echo "is a symbolic link"
	elif [ -f "$1" ] ; then
		echo "is a normal file"
	fi

	echo -n "    it "
	if [ -r "$1" ] ; then
		echo -n "can"
	else
		echo -n "can't"
	fi
	echo " be read,"

	echo -n "    "
	if [ -w "$1" ] ; then
		echo -n "can"
	else
		echo -n "can't"
	fi
	echo " be written upon,"

	echo -n "    "
	if [ -x "$1" ] ; then
		echo -n "can"
	else
		echo -n "can't"
	fi
	echo " be executed."
}


files="/etc /bin/bash /foo/bar /dev/disk/by-uuid/1C7D-CC3B"
echo $files
for f in $files
do
	testType $f
	echo $f
done

while [ 1 = 1 ] ; do
	read uservar
	if [ -z "$uservar" ] ; then
		echo "the text was empty"
	else
		echo "text: $uservar"
	fi
done
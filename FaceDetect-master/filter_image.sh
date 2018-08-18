#!/bin/bash

# this program wil delete the folder that contiains images less than 30 face
# it takes the argument of the folder name 
path=$1
var=0
total=0
for dir in ${path}/*
do
	temp=`basename $dir`
	var=`ls -l ${path}/${temp}|wc -l`
	if [ $var -le 20 ];then
		rm -rf ${path}/${temp}
		echo "directory " ${path}/${temp}" was removed"
	else
		((total=total+1))
	fi
done
echo "finally "$total" directories(labels) left"

















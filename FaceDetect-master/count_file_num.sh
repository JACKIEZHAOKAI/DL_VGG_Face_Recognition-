#!/bin/bash
path=$1
var=0
total=0
file="fileNum.txt"
dirNum=`ls -l ${path}|wc -l`
touch $file

for dir in ${path}/*
do
        temp=`basename $dir`
        var=`ls -l ${path}/${temp}|wc -l`
	echo $var >> ${file}
        total=`expr $total + $var`
done

echo "total files #:"$total >> ${file}
((div=${total}/${dirNum}))
echo "average files #:"$div >> $file

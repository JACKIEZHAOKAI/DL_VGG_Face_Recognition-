#!/bin/bash
path=$1
var=0
total=0
for dir in ${path}/*
do
	temp=`basename $dir`
	var=`ls -l ${path}/${temp}|wc -l`
	((var=var-1))
	total=`expr $total + $var`
done

echo "total: "${total}" images found."

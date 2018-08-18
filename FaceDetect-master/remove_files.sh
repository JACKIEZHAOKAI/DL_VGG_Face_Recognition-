#!/bin/bash
# program will remove a certain number of directories if number of 
# files under the directory is not enough, and for the directories that
# contains a number of files over a number, move the extra files to the new
# created dir called test while only kepping the number of files that wants
# to be remained files 
path=$1
var=0
total=0
total_Img=0
testDir="test"

mkdir $testDir

for dir in $path/*
do
	dirName=`basename $dir`
	var=`ls -l $dir|wc -l`
	((var=var-1))
	if [ $var -gt 80 ];then
                rm -rf $dir
                echo "directory" $dir "was removed"
	
        #elif [ $var -gt 30 ];then	
	#	mkdir $testDir/$dirName
	#	((testfileNum=$var-20))
	#	((total_Img=total_Img+20))
	#	((total=total+1))
	#	counter=0
	#	for i in $dir/*jpg
	#	do
	#		((counter=counter+1))
	#		echo " move "$i " to " $testDir/$dirName
	#		mv $i $testDir/$dirName
	##		if [ $counter -eq $testfileNum ];then
	#			break
	#		fi
	#	done
	else
		((total_Img=total_Img+$var))
                ((total=total+1))
        fi
done

echo "finally" $total_Img " images left"
echo "finally "$total" directories(labels) left"


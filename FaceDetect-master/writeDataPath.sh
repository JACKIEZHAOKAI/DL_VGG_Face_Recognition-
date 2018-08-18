#!/bin/bash

# program tiakes an input directory 
#write the datapath to train.txt under current directory followed by its dir name
#Also, it will produce a label.txt that contains datapath and label starting fromzero 
#  ex:   xxxxxxxxxxxxxxxxxpath label

folder=$1
#train=$2
test=$2
label="label.txt"
touch $test
#touch $train
#touch ${label}

#	counter=0
	for dir in ${folder}/*
	do	
			       name=`basename $dir`
			       count=0
			       for folder in `cat $label`	
			       do
				echo $name "  "$folder
			       if [[ $folder = $name ]]; then
					echo "marked "$count
					value=$count
					break
			       fi
			       ((count=count+1))
			       done

			       for file in ${dir}/*
			       do
			       fileName=`basename $file`
			       echo $name/$fileName" "$value >> $test 
			       echo "writing "$name/$fileName " with "$value " into " $test
			       #echo $name/$fileName" "$counter>>$train 
			       done
			       #((counter=counter+1))
			       #echo $name >> ${label}
	done

echo "train and lable files writing completed"


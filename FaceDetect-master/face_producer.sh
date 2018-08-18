#!/bin/bash

folder="./CASIA_WebFace"

new_folder="./face_CASIA_WebFace"
mkdir ${new_folder}

for dir in ${folder}/*
do
	temp=`basename $dir`
        newtemp="${new_folder}/${temp}"
	mkdir "${newtemp}"

	for file_a in  ${folder}/${temp}/*
	do
		temp_file=`basename $file_a`  
    		filepath="${folder}/${temp}/${temp_file}"  

		newfilepath="${newtemp}/${temp_file}"
		
		echo "newfile: "${newfilepath}
		echo "oldfile: "${filepath}

		# exec the python code 
		python face_detect.py ${filepath} haarcascade_frontalface_default.xml ${newfilepath}
	done
done

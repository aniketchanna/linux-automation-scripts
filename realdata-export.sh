#!/bin/bash

#Script for Rename the column

#CID
CID=401369


SAVEIFS=$IFS
IFS=$(echo -en "\n\b")
for a in `cat /home/centos/Wexpand-data/Wexpand-final-sheet.csv`
do
  echo "Now processing" "$a"

  # Breaks the file into 4 separate fields (filename, email, wkbkid, userid)
  filename=`echo $a | cut -d',' -f1`
  s3id=`echo $a | cut -d',' -f2`
  ext=`echo $a | cut -d',' -f3`
  echo "$filename"
  echo "$s3id.$ext"
  echo "$ext"

# Rename the path of file

  cp "/home/centos/Wexpand-Users-documents/$filename" /root/a_renamed
  mv "/home/centos/Wexpand-Users-documents/$filename" "/home/centos/Wexpand-s3filedata/$s3id.$ext"



done
IFS=$SAVEIFS



 

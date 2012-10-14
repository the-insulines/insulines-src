#!/bin/bash

directory=$1'/*'
scale=$2

for file in $directory;
do
  echo "$file"
  convert $file -resize "$scale" $file
done

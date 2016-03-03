#!/bin/bash
IFS="
"
declare -i j=1
for i in `ls jpg/*.jpg`; do
      convert $i gif/$j.GIF
j+=1
done

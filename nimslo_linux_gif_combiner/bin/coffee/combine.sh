#!/bin/bash
IFS="
"
declare -i j=1
for i in `ls *.JPG`; do
      convert $i $j.GIF
j+=1
done

../combiner 10 1.GIF 2.GIF 3.GIF 4.GIF out.GIF

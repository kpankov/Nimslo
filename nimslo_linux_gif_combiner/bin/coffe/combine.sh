#!/bin/bash
IFS="
"
for i in `ls *.JPG`; do
     convert $i ${i%.jpg}.gif
done

#../combiner 10 1.GIF 2.GIF 3.GIF 4.GIF out.GIF

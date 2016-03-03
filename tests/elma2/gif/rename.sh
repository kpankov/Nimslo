#!/bin/bash
for fname in `ls [1-9].GIF`; do 
  mv $fname 0$fname
done

mogrify -rotate 90 *.GIF
#!/usr/bin/bash
COUNT=$1
date > file0
for a in `seq 0 $COUNT`
do
  for b in `seq 0 $COUNT`
  do
    cp file0 file_${a}_${b}
  done
done

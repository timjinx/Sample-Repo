#!/usr/bin/bash
COUNT=$1
for a in `seq 0 $COUNT`
do
  for b in `seq 0 $COUNT`
  do
    date > file_${a}_${b}
  done
done

#!/usr/bin/bash
# This script looks for numbers containing the number 8 in a list of numbers.
# It's purpose is to demostrate the efficiency of using bash internals
# rather than asking the OS to start a new process.
COUNT=50000 # count from 1 to this number
SEARCH=8 # search for this number

bashit() {
  # use bash to create a list of numbers the wc to count them
  for x in $(seq 1 ${COUNT})
  do
    if [[ $x =~ ${SEARCH} ]]; then
       echo $x
    fi
  done | wc -l
}

grepit()  {
  # use grep instead of bash internals
  for x in $(seq 1 ${COUNT})
  do
    echo $x | grep ${SEARCH}
  done | wc -l
}

egrepit()  {
  # same but using egrep
  for x in $(seq 1 ${COUNT})
  do
    echo $x | egrep ${SEARCH}
  done | wc -l
}


countit() {
   # count as you go instead of using wc
   y=0
   for x in $(seq 1 ${COUNT})
   do
     if [[ $x =~ ${SEARCH} ]]; then
        y=$(( y + 1 ))
     fi
   done
   echo ${y}
}
echo "Counting up to ${COUNT} looking for ${SEARCH}"
echo bash
time bashit
echo "=================="
echo grep
time grepit
echo "=================="
echo egrep
time egrepit
echo "=================="
echo count
time countit
echo "=================="

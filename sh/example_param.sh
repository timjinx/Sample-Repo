#!/bin/bash
VALUES=X${*}
VALUES=`echo $VALUES | sed 's/ /^/g'`
[ `echo $VALUES | grep '\-report' ` ] && REPORT=1 || REPORT=0

for a in `echo $*`
do
   REPNAME=`echo $a | awk -F =  ' /\-repname/ { print $NF }'`
done

if [ $REPORT -eq 1 ]; then 
   echo "I'm running the report"
   echo My report is called $REPNAME
else 
   echo "I'm not running the report"
fi


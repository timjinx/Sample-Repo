#!/bin/bash
if [ "X$1" == "X" ]; then
   echo "Please pass in the directory to process"
   exit -1
fi

MYDIR=$1; export MYDIR
if [ ! -d ${MYDIR} ]; then
   echo "Can not locate ${MYDIR}"
   exit -1
fi

echo "Processing ${MYDIR}"

cd ${MYDIR}
for a in `find -type f `
do
   file $a | grep CRLF > /dev/null
   if [ $? -eq 0 ]; then
      echo "Fixing $a" 
      sed -i 's/[\r\n]//g' $a
   else
      echo "Ignoring $a"
   fi
done

#!/bin/bash
#BEGINING-OF-FILE
JOB_NUM=$1
sleep 1
cd /usr/local/share/dolphin_tools/src
echo '/export/genome_data/example_run/scripts/stepTophat2.bash'
python /usr/local/share/dolphin_tools/src/jobStatus.py -f Localhost -u docker -k VQMfXYCw8H0lZCpLGbyZvwtSTYHvT5 -s stepTophat2 -t dbSetStartTime -o /export/genome_data/example_run -j stepTophat2 -m 2 -n $JOB_NUM
   retval=$?
   if [ $retval -ne 0 ]; then
     exit 66
   fi


/export/genome_data/example_run/scripts/stepTophat2.bash

retval=$?
echo "["$retval"]"
if [ $retval -eq 0 ]; then
python /usr/local/share/dolphin_tools/src/jobStatus.py -f Localhost -u docker -k VQMfXYCw8H0lZCpLGbyZvwtSTYHvT5 -s stepTophat2 -t dbSetEndTime -o /export/genome_data/example_run -j stepTophat2 -m 3 -n $JOB_NUM
    retval=$?
   if [ $retval -ne 0 ]; then
     exit 66
   fi
  echo success
else
  echo failed
python /usr/local/share/dolphin_tools/src/jobStatus.py -f Localhost -u docker -k VQMfXYCw8H0lZCpLGbyZvwtSTYHvT5 -s stepTophat2 -t dbSetEndTime -o /export/genome_data/example_run -j stepTophat2 -m 0 -n $JOB_NUM
    retval=$?
   if [ $retval -ne 0 ]; then
     exit 66
   fi
  exit 127
fi
date
#END-OF-FILE

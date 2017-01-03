#!/bin/bash
#BEGINING-OF-FILE
JOB_NUM=$1
sleep 1
cd /usr/local/share/dolphin_tools/src
echo 'zcat /export/genome_data/process/control_rep1.2.fastq.gz  > /export/genome_data/example_run/input/control_rep1.2.fastq'
python /usr/local/share/dolphin_tools/src/jobStatus.py -f None -u docker -k kGwU8f4YSSbSTNsMt3c57DRiqtqBFG -s stepCheck -t dbSetStartTime -o /export/genome_data/example_run -j stepCheckcontrol_rep1.2 -m 2 -n $JOB_NUM
   retval=$?
   if [ $retval -ne 0 ]; then
     exit 66
   fi


zcat /export/genome_data/process/control_rep1.2.fastq.gz  > /export/genome_data/example_run/input/control_rep1.2.fastq

retval=$?
echo "["$retval"]"
if [ $retval -eq 0 ]; then
touch /export/genome_data/example_run/tmp/track/stepCheckcontrol_rep1.2.success
python /usr/local/share/dolphin_tools/src/jobStatus.py -f None -u docker -k kGwU8f4YSSbSTNsMt3c57DRiqtqBFG -s stepCheck -t dbSetEndTime -o /export/genome_data/example_run -j stepCheckcontrol_rep1.2 -m 3 -n $JOB_NUM
    retval=$?
   if [ $retval -ne 0 ]; then
     exit 66
   fi
  echo success
else
  echo failed
python /usr/local/share/dolphin_tools/src/jobStatus.py -f None -u docker -k kGwU8f4YSSbSTNsMt3c57DRiqtqBFG -s stepCheck -t dbSetEndTime -o /export/genome_data/example_run -j stepCheckcontrol_rep1.2 -m 0 -n $JOB_NUM
    retval=$?
   if [ $retval -ne 0 ]; then
     exit 66
   fi
  exit 127
fi
date
#END-OF-FILE

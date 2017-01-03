#!/bin/bash
#BEGINING-OF-FILE
JOB_NUM=$1
sleep 1
cd /usr/local/share/dolphin_tools/src
echo '/usr/local/bin/dolphin-bin/tophat2_2.0.12/tophat2 -p 4  --keep-tmp -G /export/genome_data/mousetest/mm10/ucsc.gtf  -o /export/genome_data/example_run/tophat/pipe.tophat.control_rep1 /export/genome_data/mousetest/mm10/mm10 /export/genome_data/example_run/input/control_rep1.1.fastq /export/genome_data/example_run/input/control_rep1.2.fastq  && samtools sort /export/genome_data/example_run/tophat/pipe.tophat.control_rep1/accepted_hits.bam /export/genome_data/example_run/tophat/pipe.tophat.control_rep1/control_rep1.sorted  && samtools index /export/genome_data/example_run/tophat/pipe.tophat.control_rep1/control_rep1.sorted.bam '
python /usr/local/share/dolphin_tools/src/jobStatus.py -f None -u docker -k VQMfXYCw8H0lZCpLGbyZvwtSTYHvT5 -s stepTophat2 -t dbSetStartTime -o /export/genome_data/example_run -j stepTophat2_control_rep1 -m 2 -n $JOB_NUM
   retval=$?
   if [ $retval -ne 0 ]; then
     exit 66
   fi


/usr/local/bin/dolphin-bin/tophat2_2.0.12/tophat2 -p 4  --keep-tmp -G /export/genome_data/mousetest/mm10/ucsc.gtf  -o /export/genome_data/example_run/tophat/pipe.tophat.control_rep1 /export/genome_data/mousetest/mm10/mm10 /export/genome_data/example_run/input/control_rep1.1.fastq /export/genome_data/example_run/input/control_rep1.2.fastq  && samtools sort /export/genome_data/example_run/tophat/pipe.tophat.control_rep1/accepted_hits.bam /export/genome_data/example_run/tophat/pipe.tophat.control_rep1/control_rep1.sorted  && samtools index /export/genome_data/example_run/tophat/pipe.tophat.control_rep1/control_rep1.sorted.bam 

retval=$?
echo "["$retval"]"
if [ $retval -eq 0 ]; then
touch /export/genome_data/example_run/tmp/track/stepTophat2_control_rep1.success
python /usr/local/share/dolphin_tools/src/jobStatus.py -f None -u docker -k VQMfXYCw8H0lZCpLGbyZvwtSTYHvT5 -s stepTophat2 -t dbSetEndTime -o /export/genome_data/example_run -j stepTophat2_control_rep1 -m 3 -n $JOB_NUM
    retval=$?
   if [ $retval -ne 0 ]; then
     exit 66
   fi
  echo success
else
  echo failed
python /usr/local/share/dolphin_tools/src/jobStatus.py -f None -u docker -k VQMfXYCw8H0lZCpLGbyZvwtSTYHvT5 -s stepTophat2 -t dbSetEndTime -o /export/genome_data/example_run -j stepTophat2_control_rep1 -m 0 -n $JOB_NUM
    retval=$?
   if [ $retval -ne 0 ]; then
     exit 66
   fi
  exit 127
fi
date
#END-OF-FILE

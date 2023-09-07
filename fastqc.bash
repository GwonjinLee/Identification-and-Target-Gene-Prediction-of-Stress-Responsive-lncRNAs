#!/bin/bash 
  
#PBS -N fastqc
#PBS -A PMIU0157
#PBS -e /fs/project/PMIU0157/Gwonjin_Lee/Soybean_project/scripts/outtext/fastqc.err
#PBS -o /fs/project/PMIU0157/Gwonjin_Lee/Soybean_project/scripts/outtext/fastqc.out
#PBS -q serial
#PBS -l nodes=1:ppn=8
#PBS -l walltime=24:00:00
#PBS -r y

#working space
cd /fs/project/PMIU0157/Gwonjin_Lee/Soybean_project/trimming/trimmed

module load fastqc/0.11.7

mkdir fastQC_report
ls *paired_trim.fq.gz |xargs fastqc -t 16 -o fastQC_report/       ### makes fastqc at once saving output in folder FastQCreports




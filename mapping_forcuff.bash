#!/bin/sh -l

#SBATCH --job-name Mapping_forcuff
#SBATCH -A meixiazhao
#SBATCH --mem=32G
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=4
#SBATCH --cpus-per-task=3 
#SBATCH --time=7-0:00
#SBATCH -o /blue/meixiazhao/lee.gwonjin/Soybean_project/scripts/outtext/mapping_cuff.out
#SBATCH -e /blue/meixiazhao/lee.gwonjin/Soybean_project/scripts/outtext/mapping_cuff.err
#SBATCH --mail-type=end          
#SBATCH --mail-user=lee.gwonjin@ufl.edu

#working space
cd /blue/meixiazhao/lee.gwonjin/Soybean_project/trimming/trimmed

module load hisat2
module load samtools

# This script is for mapping reads using the option --dta-cufflinks for input of cufflinks

# mapping loop for multiple trimmed files
 # Runs of .gz files 
trimmed_files=`find -name '*_paired_trim.fq.gz' | wc -l`
trimmed_sample=( $(ls *_paired_trim.fq.gz) )

for ((i=0; i<$trimmed_files; i+=2))
{
sample_name=`echo ${trimmed_sample[$i]} | awk -F "_R1" '{print $1}'`
echo "[Hisat mapping running for sample] $sample_name"
date && time 
# Mapping using hisat2
hisat2 -p 16 --no-unal --dta --dta-cufflinks \
--summary-file ../../lncRNA/mapping/mapped_sam/mapping_summary/$sample_name.summary.txt \
-x ../../reference/genome/PhytozomeV13/Gmax/Index/GmaxIndex \
-1 ${trimmed_sample[$i]} \
-2 ${trimmed_sample[$i+1]} \
-S ../../lncRNA/mapping/mapped_sam/$sample_name.sam


printf "\n\n"
}

# converting

cd /blue/meixiazhao/lee.gwonjin/Soybean_project/lncRNA/mapping/mapped_sam

for infile in *.sam
do	base=$(basename ${infile} .sam) 
## Convert to BAM files 
samtools view -bT ../../../reference/genome/PhytozomeV13/Gmax/Wm82.a4.v1/assembly/Gmax_508_v4.0.fa \
$infile > \
../converted_bam/$base.bam


#Sort BAM files
samtools sort ../converted_bam/$base.bam \
-o ../sorted_bam/$base.sort.bam


#Index sorted bam files for IGV
samtools index ../sorted_bam/$base.sort.bam \
../sorted_bam/$base.sort.bam.bai

done

#!/bin/bash

#SBATCH --job-name dexseq_count 
#SBATCH -A meixiazhao
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=2
#SBATCH --cpus-per-task=2 
#SBATCH --time=12-0:00
#SBATCH -o /blue/meixiazhao/lee.gwonjin/Soybean_project/scripts/outtext/dexseq_count.out
#SBATCH -e /blue/meixiazhao/lee.gwonjin/Soybean_project/scripts/outtext/dexseq_count.err
#SBATCH --mail-type=end          
#SBATCH --mail-user=lee.gwonjin@ufl.edu

#module load samtools
module load python
module load htseq



# Sort sam files
#cd /blue/meixiazhao/lee.gwonjin/Soybean_project/mapping/corrected_sam

#for infile in *_output_final.sam
#do	base=$(basename ${infile} _output_final.sam) 
#	samtools sort \
#	$infile \
#	-o ../../dexseq/sorted_sam/$base.sorted.sam
#	done



# Prepare the annotation file
#cd /blue/meixiazhao/lee.gwonjin/Soybean_project/reference/genome/PhytozomeV13/Gmax/Wm82.a4.v1/annotation

#python /apps/R/4.2/container/usr/local/lib/R/site-library/DEXSeq/python_scripts/dexseq_prepare_annotation.py \
#Gmax_508_Wm82.a4.v1.gene.gtf \
#Gmax_508_Wm82.a4.v1.updated.gff


# Count for dexseq
cd /blue/meixiazhao/lee.gwonjin/Soybean_project/mapping/sorted_bam

for inputbam in *.sorted.bam
do	base=$(basename ${inputbam} .sorted.bam) 
	python /apps/R/4.2/container/usr/local/lib/R/site-library/DEXSeq/python_scripts/dexseq_count.py \
	-p yes \
	-s no \
	-f bam \
	-r pos \
	../../reference/genome/PhytozomeV13/Gmax/Wm82.a4.v1/annotation/wm_gffread.gff \
	$inputbam \
	../../dexseq/$base.dex.txt
	done

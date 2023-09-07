#!/bin/sh -l

#SBATCH --job-name wmht1_rnaseq 
#SBATCH -A meixiazhao
#SBATCH --mem=72G
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=2
#SBATCH --cpus-per-task=1 
#SBATCH --time=7-0:00
#SBATCH -o /blue/meixiazhao/lee.gwonjin/Soybean_project/scripts/outtext/wmht1_rnaseq.out
#SBATCH -e /blue/meixiazhao/lee.gwonjin/Soybean_project/scripts/outtext/wmht1_rnaseq.err
#SBATCH --mail-type=end          
#SBATCH --mail-user=lee.gwonjin@ufl.edu

#working space
cd /blue/meixiazhao/lee.gwonjin/Soybean_project/

#module load trimmomatic
#module load hisat2
#module load fastqc
module load samtools
module load python/2.7.18

# Change permission for files
#chmod -R u+rwx /blue/meixiazhao/lee.gwonjin/Soybean_project/trimming/trimmed


# Trimming 
#java -jar /apps/trimmomatic/0.39/share/trimmomatic-0.39-1/trimmomatic.jar PE -threads 16 -phred33 \
#raw_data/wm_8ht1/usftp21.novogene.com/RawData/Wm8t1/Wm8t1_1.fq.gz \
#raw_data/wm_8ht1/usftp21.novogene.com/RawData/Wm8t1/Wm8t1_2.fq.gz \
#trimming/trimmed/wm_8ht1/wm_8ht1_R1_paired_trim.fq.gz \
#trimming/trimmed/unpaired_trim_reads/wm_8ht1_R1_unpaired_trim.fq.gz \
#trimming/trimmed/wm_8ht1/wm_8ht1_R2_paired_trim.fq.gz \
#trimming/trimmed/unpaired_trim_reads/wm_8ht1_R2_unpaired_trim.fq.gz \
#ILLUMINACLIP:/apps/trimmomatic/adapters/TruSeq3-PE.fa:2:30:10 \
#LEADING:3 TRAILING:3 SLIDINGWINDOW:4:20 MINLEN:75


# Fast QC
#ls trimming/trimmed/wm_8ht1/*paired_trim.fq.gz |xargs fastqc -t 8 -o trimming/trimmed/fastQC_report/  


# Mapping using hisat2
#hisat2 -p 16 --no-unal --dta \
#--summary-file mapping/mapping_summary/wm_8ht1.summary.txt \
#-x reference/genome/PhytozomeV13/Gmax/Index/GmaxIndex \
#-1 trimming/trimmed/wm_8ht1/wm_8ht1_R1_paired_trim.fq.gz \
#-2 trimming/trimmed/wm_8ht1/wm_8ht1_R2_paired_trim.fq.gz \
#-S mapping/mapped/wm_8ht1.sam


# Correction for muliple mapping reads

#1)# This script was adapted from COMEX (https://github.com/bpietzenuk/COMEX)
# Python files should be downloaded from COMEX
# Version: comex2.1 (Use python version 2)

#2) For further processing of the sam-file ends need to be generated.
#python mapping/COMEX/toprintend1.py mapping/mapped/wm_8ht1.sam mapping/mapped/wm_8ht1_end.sam

## 3) Removes the cases of mapping errors. It will remove all three possible mapping errors:
#same read id mapping to different position with same start and different end (on same chromosome) accept shorter in length
#same read id mapping to different position with different end and same end (same chromosome) accept shorter in length
#same read id mapping at same position on same chromosome
python mapping/COMEX/Selectnonrepeated1.py mapping/mapped/wm_8ht1_end.sam mapping/mapped/wm_8ht1_hits_nonrepeated.sam

## 4) Removes the ends generated in step 2). Otherwise, the program will change the .sam file format, and will compromise its use for read counting.
python mapping/COMEX/removeEnd1.py mapping/mapped/wm_8ht1_hits_nonrepeated.sam > mapping/corrected_sam/wm_8ht1_output_final.sam

## 5) Remove intermediate files
rm mapping/mapped/wm_8ht1_end.sam mapping/mapped/wm_8ht1_hits_nonrepeated.sam


# Convert to BAM files 
samtools view -bT reference/genome/PhytozomeV13/Gmax/Wm82.a4.v1/assembly/Gmax_508_v4.0.fa \
mapping/corrected_sam/wm_8ht1_output_final.sam > \
mapping/converted_bam/wm_8ht1.bam
	
#Sort BAM files
samtools sort mapping/converted_bam/wm_8ht1.bam \
-o mapping/sorted_bam/wm_8ht1.sorted.bam

#Index sorted bam files for IGV
samtools index mapping/sorted_bam/wm_8ht1.sorted.bam \
mapping/sorted_bam/wm_8ht1.sorted.bam.bai

#Count
module load htseq

htseq-count -i Name -f bam -t gene -m intersection-nonempty -s no \
mapping/sorted_bam/wm_8ht1.sorted.bam \
reference/genome/PhytozomeV13/Gmax/Wm82.a4.v1/annotation/Gmax_508_Wm82.a4.v1.gene.gff3 \
> counting/wm_8ht1.count.txt
	
	
#Check mapping stats
#samtools flagstat mapping/converted_bam/wm_8ht1.bam
#!/bin/sh -l

#SBATCH --job-name convert_counting 
#SBATCH -A meixiazhao
#SBATCH --mem=72G
#SBATCH --nodes=1
#SBATCH --ntasks=6
#SBATCH --time=4-0:00
#SBATCH -o /blue/meixiazhao/lee.gwonjin/Soybean_project/scripts/outtext/convert_counting.out
#SBATCH -e /blue/meixiazhao/lee.gwonjin/Soybean_project/scripts/outtext/convert_counting.err
#SBATCH --mail-type=end          
#SBATCH --mail-user=lee.gwonjin@ufl.edu

# working space
cd /blue/meixiazhao/lee.gwonjin/Soybean_project/mapping/corrected_sam

# Load modules
module load htseq
module load samtools


for infile in *.sam
do	base=$(basename ${infile} _output_final.sam) 
	
	## Convert to BAM files 
	samtools view -bT ../../reference/genome/PhytozomeV13/Gmax/Wm82.a4.v1/assembly/Gmax_508_v4.0.fa \
	${infile} > \
	../converted_bam/${base}.bam
	
	#Sort BAM files
	samtools sort ../converted_bam/${base}.bam \
	-o ../sorted_bam/${base}.sorted.bam

	#Index sorted bam files for IGV
	samtools index ../sorted_bam/${base}.sorted.bam \
	../sorted_bam/${base}.sorted.bam.bai

	#Count
	htseq-count -i Name -f bam -t gene -m intersection-nonempty -s no \
	../sorted_bam/${base}.sorted.bam \
	../../reference/genome/PhytozomeV13/Gmax/Wm82.a4.v1/annotation/Gmax_508_Wm82.a4.v1.gene.gff3 \
	> ../../counting/${base}.count.txt
	
	
	#Check mapping stats
	samtools flagstat ../converted_bam/${base}.bam
	
	
	done



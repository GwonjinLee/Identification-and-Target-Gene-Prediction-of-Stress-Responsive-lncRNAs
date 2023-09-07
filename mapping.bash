#!/bin/sh -l

#SBATCH --job-name Mapping_soybean 
#SBATCH -A meixiazhao
#SBATCH --mem=72G
#SBATCH --nodes=2
#SBATCH --ntasks-per-node=4
#SBATCH --cpus-per-task=2 
#SBATCH --time=7-0:00
#SBATCH -o /blue/meixiazhao/lee.gwonjin/Soybean_project/scripts/outtext/mapping_v2.out
#SBATCH -e /blue/meixiazhao/lee.gwonjin/Soybean_project/scripts/outtext/mapping_v2.err
#SBATCH --mail-type=end          
#SBATCH --mail-user=lee.gwonjin@ufl.edu

#working space
cd /blue/meixiazhao/lee.gwonjin/Soybean_project/trimming/trimmed

module load hisat2/2.2.1
module load samtools/1.15
module load htseq/0.11.2

# Change permission for files
#chmod -R u+rwx /blue/meixiazhao/lee.gwonjin/Soybean_project/trimming/trimmed

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
hisat2 -p 16 --no-unal --dta \
--summary-file ../../mapping/mapping_summary/$sample_name.summary.txt \
-x ../../reference/genome/PhytozomeV13/Gmax/Index/GmaxIndex \
-1 ${trimmed_sample[$i]} \
-2 ${trimmed_sample[$i+1]} \
-S ../../mapping/mapped/$sample_name.sam



## Convert to BAM files 
#samtools view -bT ../../reference/genome/PhytozomeV13/Gmax/Wm82.a4.v1/assembly/Gmax_508_v4.0.fa \
../../mapping/mapped/$sample_name.sam > \
../../mapping/converted_bam/$sample_name.bam



#Sort BAM files
#samtools sort ../../mapping/converted_bam/$sample_name.bam \
-o ../../mapping/sorted_bam/$sample_name.sorted.bam


#Index sorted bam files for IGV
#samtools index ../../mapping/sorted_bam/$sample_name.sorted.bam \
../../mapping/indexed_bam/$sample_name.sorted.bam.bai


printf "\n\n"
}


# Count using htseq

#for infile in ../../mapping/sorted_bam/*.sorted.bam
#do	base=$(basename ${infile} .sorted.bam) 
#	htseq-count -i Name -f bam -t gene -m intersection-nonempty -s no \
	../../mapping/sorted_bam/$base.sorted.bam \
	../../reference/genome/PhytozomeV13/Gmax/Wm82.a4.v1/annotation/Gmax_508_Wm82.a4.v1.gene.gff3 \
	> ../../counting/$base.count.txt
#	done
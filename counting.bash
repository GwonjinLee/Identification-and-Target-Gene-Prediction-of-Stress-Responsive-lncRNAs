#!/bin/sh -l

#SBATCH --job-name TEcounting 
#SBATCH -A meixiazhao
#SBATCH --mem=48G
#SBATCH --nodes=1
#SBATCH --ntasks=4
#SBATCH --cpus-per-task=3 
#SBATCH --time=5-0:00
#SBATCH -o /blue/meixiazhao/lee.gwonjin/Soybean_project/scripts/outtext/TEcounting.out
#SBATCH -e /blue/meixiazhao/lee.gwonjin/Soybean_project/scripts/outtext/TEcounting.err


# working space
cd /blue/meixiazhao/lee.gwonjin/Soybean_project/mapping/sorted_bam

# Load modules
module load htseq


# Count reads for genes using htseq

#for infile in *.sorted.bam
#do	base=$(basename ${infile} .sorted.bam) 
#	htseq-count -i Name -f bam -t gene -m intersection-nonempty -s no \
#	$base.sorted.bam \
#	../../reference/genome/PhytozomeV13/Gmax/Wm82.a4.v1/annotation/Gmax_508_Wm82.a4.v1.gene.gff3 \
#	> ../../counting/$base.count.txt
#	done



# Count TEs for genes using htseq

for infile in *.sorted.bam
do	base=$(basename ${infile} .sorted.bam) 
	htseq-count -i ID -f bam -t similarity -m intersection-nonempty -s no \
	$inflie \
	../../reference/genome/PhytozomeV13/Gmax/TE/Gmax_508_Wm82.a4.v1.TE.gff3 \
	> ../../TE/TE_counts/$base.TE.txt
	done


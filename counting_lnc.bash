#!/bin/sh -l

#SBATCH --job-name lnccounting 
#SBATCH -A meixiazhao
#SBATCH --mem=36G
#SBATCH --nodes=2
#SBATCH --ntasks=4
#SBATCH --cpus-per-task=5 
#SBATCH --time=7-0:00
#SBATCH -o /blue/meixiazhao/lee.gwonjin/Soybean_project/scripts/outtext/lnccounting.out
#SBATCH -e /blue/meixiazhao/lee.gwonjin/Soybean_project/scripts/outtext/lnccounting.err
#SBATCH --mail-type=all          
#SBATCH --mail-user=lee.gwonjin@ufl.edu

# working space
cd /blue/meixiazhao/lee.gwonjin/Soybean_project/lncRNA/mapping/sorted_bam

# Load modules

module load htseq

# Count lincRNAs for genes using htseq

for infile in *.sort.bam
do	base=$(basename ${infile} .sort.bam) 
	htseq-count -i gene_id -f bam -t exon -m intersection-nonempty -s no \
	$infile \
	/blue/meixiazhao/lee.gwonjin/Soybean_project/lncRNA/evolinc/onlylincRNA.updated.gtf \
	> /blue/meixiazhao/lee.gwonjin/Soybean_project/lncRNA/counts/NonTE/$base.linc.txt
	done




#!/bin/sh -l

#SBATCH --job-name lnccounting_TEderpara
#SBATCH -A meixiazhao
#SBATCH --mem=96G
#SBATCH --nodes=4
#SBATCH --ntasks=20
#SBATCH --cpus-per-task=10 
#SBATCH --qos=meixiazhao-b 
#SBATCH --time=3-12:00
#SBATCH -o /blue/meixiazhao/lee.gwonjin/Soybean_project/scripts/outtext/lnccounting_TEderpara.out
#SBATCH -e /blue/meixiazhao/lee.gwonjin/Soybean_project/scripts/outtext/lnccounting_TEderpara.err
#SBATCH --mail-type=all          
#SBATCH --mail-user=lee.gwonjin@ufl.edu

# working space
cd /blue/meixiazhao/lee.gwonjin/Soybean_project/lncRNA/mapping/sorted_bam/parallel

# Load modules

module load htseq

# Count lincRNAs for genes using htseq

for infile in *.sort.bam
do	base=$(basename ${infile} .sort.bam) 
	htseq-count -i gene_id -f bam -t exon -m intersection-nonempty -s no \
	$infile \
	/blue/meixiazhao/lee.gwonjin/Soybean_project/lncRNA/evolinc/noTE_lincRNA/TE_derived_linRNA.gtf \
	> /blue/meixiazhao/lee.gwonjin/Soybean_project/lncRNA/counts/NonTE/TE_derived_linc/para/$base.TEderlinc.txt
	done




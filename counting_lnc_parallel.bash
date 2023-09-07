#!/bin/sh -l

#SBATCH --job-name lnccounting 
#SBATCH -A meixiazhao
#SBATCH --mem=48G
#SBATCH --nodes=2
#SBATCH --ntasks=6
#SBATCH --cpus-per-task=2 
#SBATCH --time=7-0:00
#SBATCH -o /blue/meixiazhao/lee.gwonjin/Soybean_project/scripts/outtext/lnccounting_TE_par.out
#SBATCH -e /blue/meixiazhao/lee.gwonjin/Soybean_project/scripts/outtext/lnccounting_TE_par.err
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
	../../../evolinc/evolinc_out/onlylincRNA.updated.gtf \
	> ../../../counts/NonTE/parallel/$base.linc.txt
	done




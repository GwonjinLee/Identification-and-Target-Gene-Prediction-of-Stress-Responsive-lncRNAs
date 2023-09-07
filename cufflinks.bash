#!/bin/sh -l

#SBATCH --job-name cufflinks
#SBATCH -A meixiazhao
#SBATCH --mem=32G
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=2
#SBATCH --cpus-per-task=2 
#SBATCH --time=7-0:00
#SBATCH -o /blue/meixiazhao/lee.gwonjin/Soybean_project/scripts/outtext/cufflinks2.out
#SBATCH -e /blue/meixiazhao/lee.gwonjin/Soybean_project/scripts/outtext/cufflinks2.err
#SBATCH --mail-type=end          
#SBATCH --mail-user=lee.gwonjin@ufl.edu

#working space
cd /blue/meixiazhao/lee.gwonjin/Soybean_project/lncRNA/mapping/sorted_bam

module load cufflinks


# test cufflinks just for a single sample
#cufflinks cf_16hc2.sort.bam -o cf_16hc2


for infile in *.bam
do	base=$(basename ${infile} .sort.bam) 
	
	cufflinks $infile -o $base
	
done


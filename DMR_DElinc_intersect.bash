#!/bin/sh -l

#SBATCH --job-name DMR_lnc_intersect 
#SBATCH -A meixiazhao
#SBATCH --mem=24G
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=2
#SBATCH --cpus-per-task=2
#SBATCH --time=3-0:00
#SBATCH -o /blue/meixiazhao/lee.gwonjin/Soybean_project/scripts/outtext/DMR_lnc_intersect.out
#SBATCH -e /blue/meixiazhao/lee.gwonjin/Soybean_project/scripts/outtext/DMR_lnc_intersect.err
#SBATCH --mail-type=all          
#SBATCH --mail-user=lee.gwonjin@ufl.edu

# Load modules
module load bedtools


#working space
cd /blue/meixiazhao/lee.gwonjin/Soybean_project/lncRNA/methylation/DMR

bedtools intersect -wo -a sigDE_NoTElinc_TElinc_Merged_pval.bed \
-b DMRmerged.bed > DMR_DElincRNA_intersect.txt



#!/bin/sh -l

#SBATCH --job-name peri_DETE
#SBATCH -A meixiazhao
#SBATCH --mem=36G
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=2
#SBATCH --time=3-0:00
#SBATCH -o /blue/meixiazhao/lee.gwonjin/Soybean_project/scripts/outtext/peri_DETE.out
#SBATCH -e /blue/meixiazhao/lee.gwonjin/Soybean_project/scripts/outtext/peri_DETE.err
#SBATCH --mail-type=all          
#SBATCH --mail-user=lee.gwonjin@ufl.edu

# Load modules
module load bedtools


#working space
cd /blue/meixiazhao/lee.gwonjin/Soybean_project/TE/peri


#DE TEs location in pericentromeric or arm regions

##intersect
bedtools intersect -wa -wb -a DE_TE.gtf \
-b peri_soybean.bed \
> peri_DETE.bed
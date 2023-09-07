#!/bin/sh -l

#SBATCH --job-name TE_location
#SBATCH -A meixiazhao
#SBATCH --mem=36G
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=2
#SBATCH --time=3-0:00
#SBATCH -o /blue/meixiazhao/lee.gwonjin/Soybean_project/scripts/outtext/TE_location.out
#SBATCH -e /blue/meixiazhao/lee.gwonjin/Soybean_project/scripts/outtext/TE_location.err
#SBATCH --mail-type=all          
#SBATCH --mail-user=lee.gwonjin@ufl.edu

# Load modules
module load bedtools


#working space
cd /blue/meixiazhao/lee.gwonjin/Soybean_project/TE/locationwgene


#DE TEs location in pericentromeric or arm regions

##intersect for genes
#bedtools intersect -a TE.bed \
#-b gene_component_wstream.bed -wo \
#> TE_locationwgene.bed

#intersect for pericentromeric or arm regions
bedtools intersect -a TE.bed \
-b peri.bed -wo \
> TE_locationwperi.bed

#!/bin/sh -l

#SBATCH --job-name cis_target_TE
#SBATCH -A meixiazhao
#SBATCH --mem=36G
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=2
#SBATCH --time=3-0:00
#SBATCH -o /blue/meixiazhao/lee.gwonjin/Soybean_project/scripts/outtext/cis_target_TE.out
#SBATCH -e /blue/meixiazhao/lee.gwonjin/Soybean_project/scripts/outtext/cis_target_TE.err
#SBATCH --mail-type=all          
#SBATCH --mail-user=lee.gwonjin@ufl.edu

# Load modules
module load bedtools


#working space
cd /blue/meixiazhao/lee.gwonjin/Soybean_project/TE/cistarget


#For TE-containing DE TEs and all TE-containing lincRNAs

##2kb window 
bedtools intersect -wo -a DE_TE.gtf \
-b DE_TElinc.bed \
> results/DETE_DETElinc_intersect_NEW.bed


#For TE-containing DE TEs and genes

##Intersection 
#bedtools intersect -wa -wb -a DE_TE.gtf \
#-b /blue/meixiazhao/lee.gwonjin/Soybean_project/reference/genome/PhytozomeV13/Gmax/Wm82.a4.v1/annotation/Gmax_508_Wm82.a4.v1.gene.gff3 \
#> results/DETE_intersectgenes.bed

##2kb window 
#bedtools window -a DE_TE.gtf \
#-b /blue/meixiazhao/lee.gwonjin/Soybean_project/reference/genome/PhytozomeV13/Gmax/Wm82.a4.v1/annotation/Gmax_508_Wm82.a4.v1.gene.gff3 \
#-l 2100 -r 2100 > results/DETE_cisgenes_2.1kb.bed

##5kb window 
#bedtools window -a DE_TE.gtf \
#-b /blue/meixiazhao/lee.gwonjin/Soybean_project/reference/genome/PhytozomeV13/Gmax/Wm82.a4.v1/annotation/Gmax_508_Wm82.a4.v1.gene.gff3 \
#-l 5000 -r 5000 > results/DETE_cisgenes_5kb.bed


#For TE-containing DE TEs and DE TE-containing lincRNAs

##2kb window 
#bedtools window -a DE_TE.gtf \
#-b TEcontain_DE_lincRNA.gtf \
#-l 2000 -r 2000 > results/DETE_DElinc_2kb.bed

##2kb window (reverse)
#bedtools window -b DE_TE.gtf \
#-a TEcontain_DE_lincRNA.gtf \
#-l 2000 -r 2000 > results/DElinc_DETE_2kb.bed

##5kb window 
#bedtools window -a DE_TE.gtf \
#-b TEcontain_DE_lincRNA.gtf \
#-l 5000 -r 5000 > results/DETE_DElinc_5kb.bed

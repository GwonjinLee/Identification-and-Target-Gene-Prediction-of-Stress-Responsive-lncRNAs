#!/bin/sh -l

#SBATCH --job-name cis_target_linc 
#SBATCH -A meixiazhao
#SBATCH --mem=24G
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=2
#SBATCH --cpus-per-task=2
#SBATCH --time=3-0:00
#SBATCH -o /blue/meixiazhao/lee.gwonjin/Soybean_project/scripts/outtext/cis_target_linc.out
#SBATCH -e /blue/meixiazhao/lee.gwonjin/Soybean_project/scripts/outtext/cis_target_linc.err
#SBATCH --mail-type=all          
#SBATCH --mail-user=lee.gwonjin@ufl.edu

# Load modules
module load bedtools


#working space
cd /blue/meixiazhao/lee.gwonjin/Soybean_project/lncRNA/cistarget




#For TE-containing DE lincRNA and TEs
##10kb window 
#bedtools window -a TEcontain_DE_lincRNA.gtf \
#-b /blue/meixiazhao/lee.gwonjin/Soybean_project/reference/genome/PhytozomeV13/Gmax/TE/Gmax_508_Wm82.a4.v1.TE_updated.gff3 \
#-l 10000 -r 10000 > results/TEderived_DE_lincRNA_cisTEs_10kb.bed

##5kb window 
#bedtools window -a TEcontain_DE_lincRNA.gtf \
#-b /blue/meixiazhao/lee.gwonjin/Soybean_project/reference/genome/PhytozomeV13/Gmax/TE/Gmax_508_Wm82.a4.v1.TE_updated.gff3 \
#-l 5000 -r 5000 > results/TEderived_DE_lincRNA_cisTEs_5kb.bed



#For DE lincRNA and genes
##20kb window 
#bedtools window -a NoTE_DE_lincRNA.gtf -b Gmax_508_Wm82.a4.v1.onlygene.gff3 -l 20000 -r 20000 > results/NoTE_DE_llincRNA_cisgenes_20kb.bed 
#bedtools window -a TEcontain_DE_lincRNA.gtf -b Gmax_508_Wm82.a4.v1.onlygene.gff3 -l 20000 -r 20000 > results/TEderived_DE_lincRNA_cisgenes_20kb.bed

##10kb window 
bedtools window -a DE_noTElinc.bed -b Gmax_508_Wm82.a4.v1.onlygene.gff3 -l 10000 -r 10000 > results/NoTE_DE_llincRNA_cisgenes_10kb_new.bed 
#bedtools window -a TEcontain_DE_lincRNA.gtf -b Gmax_508_Wm82.a4.v1.onlygene.gff3 -l 10000 -r 10000 > results/TEderived_DE_lincRNA_cisgenes_10kb.bed

##5kb window 
bedtools window -a DE_noTElinc.bed -b Gmax_508_Wm82.a4.v1.onlygene.gff3 -l 5000 -r 5000 > results/NoTE_DE_llincRNA_cisgenes_5kb_new.bed 
#bedtools window -a TEcontain_DE_lincRNA.gtf -b Gmax_508_Wm82.a4.v1.onlygene.gff3 -l 5000 -r 5000 > results/TEderived_DE_lincRNA_cisgenes_5kb.bed



# For all
##10kb window 
#bedtools window -a NoTEllincRNA.updated.gtf -b Gmax_508_Wm82.a4.v1.onlygene.gff3 -l 10000 -r 10000 > results/NoTEllincRNA_cisgenes_10kb.bed 
#bedtools window -a TE_derived_lincRNA.gtf -b Gmax_508_Wm82.a4.v1.onlygene.gff3 -l 10000 -r 10000 > results/TE_derived_lincRNA_cisgenes_10kb.bed

##5kb window 
#bedtools window -a NoTEllincRNA.updated.gtf -b Gmax_508_Wm82.a4.v1.onlygene.gff3 -l 5000 -r 5000 > results/NoTEllincRNA_cisgenes_5kb.bed 
#bedtools window -a TE_derived_lincRNA.gtf -b Gmax_508_Wm82.a4.v1.onlygene.gff3 -l 5000 -r 5000 > results/TE_derived_lincRNA_cisgenes_5kb.bed

##2kb window (got nothing)
#bedtools window -a NoTEllincRNA.updated.gtf -b Gmax_208_Wm82.a4.v1.onlygene.gff3 -l 2000 -r 2000 > results/NoTEllincRNA_cisgenes_2kb.bed 
#bedtools window -a TE_derived_lincRNA.gtf -b Gmax_208_Wm82.a4.v1.onlygene.gff3 -l 2000 -r 2000 > results/TE_derived_lincRNA_cisgenes_2kb.bed


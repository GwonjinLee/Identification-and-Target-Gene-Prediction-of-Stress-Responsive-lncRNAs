#!/bin/sh -l

#SBATCH --job-name miRNA_gfftofa 
#SBATCH -A meixiazhao
#SBATCH --mem=24G
#SBATCH --nodes=1
#SBATCH --ntasks=2
#SBATCH --cpus-per-task=2 
#SBATCH --time=7-0:00
#SBATCH -o /blue/meixiazhao/lee.gwonjin/Soybean_project/scripts/outtext/miRNA_gfftofa.out
#SBATCH -e /blue/meixiazhao/lee.gwonjin/Soybean_project/scripts/outtext/miRNA_gfftofa.err
#SBATCH --mail-type=all          
#SBATCH --mail-user=lee.gwonjin@ufl.edu

cd /blue/meixiazhao/lee.gwonjin/Soybean_project/lncRNA/mirna

module load gff3toolkit

gff3_to_fasta -g mirna_gmv2.gff3 \
-f Glycine_max_v2.0.fa \
-st gene \
-d simple \
-o miRNAseq

#changed TE to gene and run this code because TE is not recognized in gff3toolkit.
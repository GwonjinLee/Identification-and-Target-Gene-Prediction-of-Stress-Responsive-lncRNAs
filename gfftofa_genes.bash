#!/bin/sh -l

#SBATCH --job-name gfftofa_genes 
#SBATCH -A meixiazhao
#SBATCH --mem=24G
#SBATCH --nodes=1
#SBATCH --ntasks=2
#SBATCH --cpus-per-task=2 
#SBATCH --time=7-0:00
#SBATCH -o /blue/meixiazhao/lee.gwonjin/Soybean_project/scripts/outtext/gfftofa_genes.out
#SBATCH -e /blue/meixiazhao/lee.gwonjin/Soybean_project/scripts/outtext/gfftofa_genes.err
#SBATCH --mail-type=all          
#SBATCH --mail-user=lee.gwonjin@ufl.edu

cd /blue/meixiazhao/lee.gwonjin/Soybean_project/reference/genome/PhytozomeV13/Gmax/Wm82.a4.v1/annotation

module load gff3toolkit

gff3_to_fasta -g Gmax_508_Wm82.a4.v1.gene.gff3 \
-f ../assembly/Gmax_508_v4.0.fa \
-st gene \
-d simple \
-o /blue/meixiazhao/lee.gwonjin/Soybean_project/lncRNA/mirna/gene_seq

#changed TE to gene and run this code because TE is not recognized in gff3toolkit.
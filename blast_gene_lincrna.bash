#!/bin/sh -l

#SBATCH --job-name blast_mirna 
#SBATCH -A meixiazhao
#SBATCH --mem=24G
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=2
#SBATCH --cpus-per-task=2
#SBATCH --time=3-0:00
#SBATCH -o /blue/meixiazhao/lee.gwonjin/Soybean_project/scripts/outtext/blast_mirna.out
#SBATCH -e /blue/meixiazhao/lee.gwonjin/Soybean_project/scripts/outtext/blast_mirna.err
#SBATCH --mail-type=all          
#SBATCH --mail-user=lee.gwonjin@ufl.edu

# Load modules
module load ncbi_blast


#working space
cd /blue/meixiazhao/lee.gwonjin/Soybean_project/lncRNA/mirna

#blast miRNA containing lincRNA with genes
blastn -perc_identity 100 -word_size 50 -evalue 0.01 -query miRNAcontaininglincRNA.fasta -subject gene_seq.fa -dust no -outfmt 6 -out blast_miRNAcontalincRNA_genes.txt


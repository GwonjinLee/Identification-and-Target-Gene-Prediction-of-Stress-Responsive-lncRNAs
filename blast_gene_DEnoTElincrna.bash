#!/bin/sh -l

#SBATCH --job-name blast_DEnoTElinc 
#SBATCH -A meixiazhao
#SBATCH --mem=24G
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=2
#SBATCH --cpus-per-task=2
#SBATCH --time=3-0:00
#SBATCH -o /blue/meixiazhao/lee.gwonjin/Soybean_project/scripts/outtext/blast_DEnoTElinc.out
#SBATCH -e /blue/meixiazhao/lee.gwonjin/Soybean_project/scripts/outtext/blast_DEnoTElinc.err
#SBATCH --mail-type=all          
#SBATCH --mail-user=lee.gwonjin@ufl.edu

# Load modules
module load ncbi_blast


#working space
cd /blue/meixiazhao/lee.gwonjin/Soybean_project/lncRNA/evolinc/noTE_lincRNA/blast

#blast miRNA containing lincRNA with genes
blastn -perc_identity 95 -word_size 50 -evalue 0.01 -query DE_noTElincRNA.fasta -subject gene_seq.fa -dust no -outfmt 6 -out blast_DE_noTElincRNA_genes.txt


#!/bin/sh -l

#SBATCH --job-name blast_XLOC_059371 
#SBATCH -A meixiazhao
#SBATCH --mem=24G
#SBATCH --nodes=2
#SBATCH --ntasks-per-node=2
#SBATCH --cpus-per-task=2
#SBATCH --time=3-0:00
#SBATCH -o /blue/meixiazhao/lee.gwonjin/Soybean_project/scripts/outtext/blast_XLOC_059371.out
#SBATCH -e /blue/meixiazhao/lee.gwonjin/Soybean_project/scripts/outtext/blast_XLOC_059371.err
#SBATCH --mail-type=all          
#SBATCH --mail-user=lee.gwonjin@ufl.edu

# Load modules
module load ncbi_blast


#working space
cd /blue/meixiazhao/lee.gwonjin/Soybean_project/lncRNA/transtarget/XLOC_059371

#blast miRNA containing lincRNA with genes
blastn -perc_identity 90 -word_size 15 -evalue 2 -query XLOC_059371_seq.fa -subject trans_targets_XLOC_059371_seq.fa -dust no -outfmt 6 -out blast_XLOC_059371_transtargetgenes.txt


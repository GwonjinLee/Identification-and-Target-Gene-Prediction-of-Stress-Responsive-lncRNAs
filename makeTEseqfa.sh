#!/bin/sh -l

#SBATCH --job-name TEseqfa 
#SBATCH -A meixiazhao
#SBATCH --mem=24G
#SBATCH --nodes=1
#SBATCH --ntasks=2
#SBATCH --cpus-per-task=2 
#SBATCH --time=7-0:00
#SBATCH -o /blue/meixiazhao/lee.gwonjin/Soybean_project/scripts/outtext/TEseqfa.out
#SBATCH -e /blue/meixiazhao/lee.gwonjin/Soybean_project/scripts/outtext/TEseqfa.err
#SBATCH --mail-type=all          
#SBATCH --mail-user=lee.gwonjin@ufl.edu

cd /blue/meixiazhao/lee.gwonjin/Soybean_project/reference/genome/PhytozomeV13/Gmax/TE

module load gff3toolkit

gff3_to_fasta -g Gmax_508_Wm82.a4.v1.TE_updated.gff3 \
-f ../Wm82.a4.v1/assembly/Gmax_508_v4.0.fa \
-st gene \
-d simple \
-o TE_seqforEvolinc/TE_sequences

#changed TE to gene and run this code because TE is not recognized in gff3toolkit.
#!/bin/bash

#SBATCH --job-name gfftogtf 
#SBATCH -A meixiazhao
#SBATCH --mem=48G
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=2
#SBATCH --cpus-per-task=2 
#SBATCH --time=12-0:00
#SBATCH -o /blue/meixiazhao/lee.gwonjin/Soybean_project/scripts/outtext/gfftogtf.out
#SBATCH -e /blue/meixiazhao/lee.gwonjin/Soybean_project/scripts/outtext/gfftogtf.err
#SBATCH --mail-type=end          
#SBATCH --mail-user=lee.gwonjin@ufl.edu


cd /blue/meixiazhao/lee.gwonjin/Soybean_project/reference/genome/PhytozomeV13/Gmax/Wm82.a4.v1/annotation

#module load samtools
module load gffread
module load genometools
module load eautils
module load transdecoder

# Convert gff3 to gtf

gffread -E Gmax_508_Wm82.a4.v1.gene.gff3 -T -o wm_gffread.gtf

gt gff3_to_gtf Gmax_508_Wm82.a4.v1.gene.gff3 > wm_genometools.gtf

gff3_gene_to_gtf_format.pl Gmax_508_Wm82.a4.v1.gene.gff3 ../assembly/Gmax_508_v4.0.fa > wm_transdecoder.gtf

gff2gtf-eautils Gmax_508_Wm82.a4.v1.gene.gff3 > wm_eautils.gtf


# Prepare the annotation file (gtf to gff for dexseq)
python /apps/R/4.2/container/usr/local/lib/R/site-library/DEXSeq/python_scripts/dexseq_prepare_annotation.py \
wm_gffread.gtf \
wm_gffread.gff

python /apps/R/4.2/container/usr/local/lib/R/site-library/DEXSeq/python_scripts/dexseq_prepare_annotation.py \
wm_genometools.gtf \
wm_genometools.gff

python /apps/R/4.2/container/usr/local/lib/R/site-library/DEXSeq/python_scripts/dexseq_prepare_annotation.py \
wm_transdecoder.gtf \
wm_transdecoder.gff

python /apps/R/4.2/container/usr/local/lib/R/site-library/DEXSeq/python_scripts/dexseq_prepare_annotation.py \
wm_eautils.gtf \
wm_eautils.gff

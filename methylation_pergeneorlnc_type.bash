#!/bin/sh -l

#SBATCH --job-name mean_methylation_perlinc
#SBATCH -A meixiazhao
#SBATCH --mem=48G
#SBATCH --nodes=2
#SBATCH --ntasks=4
#SBATCH --cpus-per-task=4 
#SBATCH --time=5-0:00
#SBATCH -o /blue/meixiazhao/lee.gwonjin/Soybean_project/scripts/outtext/mean_methylation_TE.out
#SBATCH -e /blue/meixiazhao/lee.gwonjin/Soybean_project/scripts/outtext/mean_methylation_TE.err
#SBATCH --mail-type=all          
#SBATCH --mail-user=lee.gwonjin@ufl.edu


# working space
cd /blue/meixiazhao/lee.gwonjin/Soybean_project/lncRNA/methylation

# Load modules
module load bedtools

# Loop through each file
for infile in *_cytosine_20chrs.txt
do
  base=$(basename "${infile}" _cytosine_20chrs.txt)

# Generate the modified table file with proportion column
# awk 'BEGIN{OFS="\t"} {proportion = ($4 + $5) == 0 ? "NA" : $4 / ($4 + $5); \
# print $1, $2, $2, $6, proportion, $3, $4, $5,  $7 }' \
# $infile > $base.methyl_proportion.bed


  # Remove rows with "NA" in the proportion column
#  awk '$5 != "NA"' "${base}.methyl_proportion.bed" > "${base}.methyl_proportion_no_na.bed"

  # Split the file based on methylation type
#  awk -v base="${base}.methyl_proportion_no_na" '$4 == "CHH" { print > (base"_CHH.bed") }
#                                                  $4 == "CG" { print > (base"_CG.bed") }
#                                                  $4 == "CHG" { print > (base"_CHG.bed") }' \
#    "${base}.methyl_proportion_no_na.bed"

  # Use bedtools map to calculate mean methylation ratio per gene for each type
#  bedtools map -a onlygene_convert.bed -b "${base}.methyl_proportion_no_na_CHH.bed" -c 5 -o mean > \
#    "${base}.mean_methylation_CHH_gene.txt"
#  bedtools map -a onlygene_convert.bed -b "${base}.methyl_proportion_no_na_CG.bed" -c 5 -o mean > \
#   "${base}.mean_methylation_CG_gene.txt"
#  bedtools map -a onlygene_convert.bed -b "${base}.methyl_proportion_no_na_CHG.bed" -c 5 -o mean > \
#    "${base}.mean_methylation_CHG_gene.txt"

  # Use bedtools map to calculate mean methylation ratio per NoTElincRNAs for each type
#  bedtools map -a Transctipts64Assembly.gtf.lincRNAs.bed -b "${base}.methyl_proportion_no_na_CHH.bed" -c 5 -o mean > \
#    "${base}.mean_methylation_CHH_noTElinc.txt"
#  bedtools map -a Transctipts64Assembly.gtf.lincRNAs.bed -b "${base}.methyl_proportion_no_na_CG.bed" -c 5 -o mean > \
#    "${base}.mean_methylation_CG_noTElinc.txt"
#  bedtools map -a Transctipts64Assembly.gtf.lincRNAs.bed -b "${base}.methyl_proportion_no_na_CHG.bed" -c 5 -o mean > \
#    "${base}.mean_methylation_CHG_noTElinc.txt"

  # Use bedtools map to calculate mean methylation ratio per TE_containlincRNAs for each type
#  bedtools map -a TE_containing_transcripts.bed -b "${base}.methyl_proportion_no_na_CHH.bed" -c 5 -o mean > \
#    "${base}.mean_methylation_CHH_TE_containlinc.txt"
#  bedtools map -a TE_containing_transcripts.bed -b "${base}.methyl_proportion_no_na_CG.bed" -c 5 -o mean > \
#    "${base}.mean_methylation_CG_TE_containlinc.txt"
#  bedtools map -a TE_containing_transcripts.bed -b "${base}.methyl_proportion_no_na_CHG.bed" -c 5 -o mean > \
#    "${base}.mean_methylation_CHG_TE_containlinc.txt"

  # Use bedtools map to calculate mean methylation ratio per TE for each type
  bedtools map -a TE_updated.bed -b "${base}.methyl_proportion_no_na_CHH.bed" -c 5 -o mean > \
    "${base}.mean_methylation_CHH_TEs.txt"
  bedtools map -a TE_updated.bed -b "${base}.methyl_proportion_no_na_CG.bed" -c 5 -o mean > \
    "${base}.mean_methylation_CG_TEs.txt"
  bedtools map -a TE_updated.bed -b "${base}.methyl_proportion_no_na_CHG.bed" -c 5 -o mean > \
    "${base}.mean_methylation_CHG_TEs.txt"

done

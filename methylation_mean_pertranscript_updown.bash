#!/bin/sh -l

#SBATCH --job-name mean_methylation_perlinc
#SBATCH -A meixiazhao
#SBATCH --mem=36G
#SBATCH --nodes=2
#SBATCH --ntasks=3
#SBATCH --cpus-per-task=4 
#SBATCH --time=5-0:00
#SBATCH -o /blue/meixiazhao/lee.gwonjin/Soybean_project/scripts/outtext/mean_methylation_updown.out
#SBATCH -e /blue/meixiazhao/lee.gwonjin/Soybean_project/scripts/outtext/mean_methylation_updown.err
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


## 2kb upstream
  # Use bedtools map to calculate mean methylation ratio per gene for each type
  bedtools map -a 2kb_upstream_gene.bed -b "${base}.methyl_proportion_no_na_CHH.bed" -c 5 -o mean > \
    updown/"${base}.mean_methylation_CHH_gene_2kb_up.txt"
  bedtools map -a 2kb_upstream_gene.bed -b "${base}.methyl_proportion_no_na_CG.bed" -c 5 -o mean > \
   updown/"${base}.mean_methylation_CG_gene_2kb_up.txt"
  bedtools map -a 2kb_upstream_gene.bed -b "${base}.methyl_proportion_no_na_CHG.bed" -c 5 -o mean > \
    updown/"${base}.mean_methylation_CHG_gene_2kb_up.txt"

  # Use bedtools map to calculate mean methylation ratio per NoTElincRNAs for each type
  bedtools map -a 2kb_upstream_NonTElinc.bed -b "${base}.methyl_proportion_no_na_CHH.bed" -c 5 -o mean > \
    updown/"${base}.mean_methylation_CHH_noTElinc_2kb_up.txt"
  bedtools map -a 2kb_upstream_NonTElinc.bed -b "${base}.methyl_proportion_no_na_CG.bed" -c 5 -o mean > \
    updown/"${base}.mean_methylation_CG_noTElinc_2kb_up.txt"
  bedtools map -a 2kb_upstream_NonTElinc.bed -b "${base}.methyl_proportion_no_na_CHG.bed" -c 5 -o mean > \
    updown/"${base}.mean_methylation_CHG_noTElinc_2kb_up.txt"

  # Use bedtools map to calculate mean methylation ratio per TE_containlincRNAs for each type
  bedtools map -a 2kb_upstream_TEderivedlinc.bed -b "${base}.methyl_proportion_no_na_CHH.bed" -c 5 -o mean > \
    updown/"${base}.mean_methylation_CHH_TE_containlinc_2kb_up.txt"
  bedtools map -a 2kb_upstream_TEderivedlinc.bed -b "${base}.methyl_proportion_no_na_CG.bed" -c 5 -o mean > \
    updown/"${base}.mean_methylation_CG_TE_containlinc_2kb_up.txt"
  bedtools map -a 2kb_upstream_TEderivedlinc.bed -b "${base}.methyl_proportion_no_na_CHG.bed" -c 5 -o mean > \
    updown/"${base}.mean_methylation_CHG_TE_containlinc_2kb_up.txt"

  # Use bedtools map to calculate mean methylation ratio per TE for each type
  bedtools map -a 2kb_upstream_TE.bed -b "${base}.methyl_proportion_no_na_CHH.bed" -c 5 -o mean > \
    updown/"${base}.mean_methylation_CHH_TEs_2kb_up.txt"
  bedtools map -a 2kb_upstream_TE.bed -b "${base}.methyl_proportion_no_na_CG.bed" -c 5 -o mean > \
    updown/"${base}.mean_methylation_CG_TEs_2kb_up.txt"
  bedtools map -a 2kb_upstream_TE.bed -b "${base}.methyl_proportion_no_na_CHG.bed" -c 5 -o mean > \
    updown/"${base}.mean_methylation_CHG_TEs_2kb_up.txt"


## 2kb downstream
  # Use bedtools map to calculate mean methylation ratio per gene for each type
  bedtools map -a 2kb_downstream_gene.bed -b "${base}.methyl_proportion_no_na_CHH.bed" -c 5 -o mean > \
    updown/"${base}.mean_methylation_CHH_gene_2kb_down.txt"
  bedtools map -a 2kb_downstream_gene.bed -b "${base}.methyl_proportion_no_na_CG.bed" -c 5 -o mean > \
   updown/"${base}.mean_methylation_CG_gene_2kb_down.txt"
  bedtools map -a 2kb_downstream_gene.bed -b "${base}.methyl_proportion_no_na_CHG.bed" -c 5 -o mean > \
    updown/"${base}.mean_methylation_CHG_gene_2kb_down.txt"

  # Use bedtools map to calculate mean methylation ratio per NoTElincRNAs for each type
  bedtools map -a 2kb_downstream_NonTElinc.bed -b "${base}.methyl_proportion_no_na_CHH.bed" -c 5 -o mean > \
    updown/"${base}.mean_methylation_CHH_noTElinc_2kb_down.txt"
  bedtools map -a 2kb_downstream_NonTElinc.bed -b "${base}.methyl_proportion_no_na_CG.bed" -c 5 -o mean > \
    updown/"${base}.mean_methylation_CG_noTElinc_2kb_down.txt"
  bedtools map -a 2kb_downstream_NonTElinc.bed -b "${base}.methyl_proportion_no_na_CHG.bed" -c 5 -o mean > \
    updown/"${base}.mean_methylation_CHG_noTElinc_2kb_down.txt"

  # Use bedtools map to calculate mean methylation ratio per TE_containlincRNAs for each type
  bedtools map -a 2kb_downstream_TEderivedlinc.bed -b "${base}.methyl_proportion_no_na_CHH.bed" -c 5 -o mean > \
    updown/"${base}.mean_methylation_CHH_TE_containlinc_2kb_down.txt"
  bedtools map -a 2kb_downstream_TEderivedlinc.bed -b "${base}.methyl_proportion_no_na_CG.bed" -c 5 -o mean > \
    updown/"${base}.mean_methylation_CG_TE_containlinc_2kb_down.txt"
  bedtools map -a 2kb_downstream_TEderivedlinc.bed -b "${base}.methyl_proportion_no_na_CHG.bed" -c 5 -o mean > \
    updown/"${base}.mean_methylation_CHG_TE_containlinc_2kb_down.txt"

  # Use bedtools map to calculate mean methylation ratio per TE for each type
  bedtools map -a 2kb_downstream_TE.bed -b "${base}.methyl_proportion_no_na_CHH.bed" -c 5 -o mean > \
    updown/"${base}.mean_methylation_CHH_TEs_2kb_down.txt"
  bedtools map -a 2kb_downstream_TE.bed -b "${base}.methyl_proportion_no_na_CG.bed" -c 5 -o mean > \
    updown/"${base}.mean_methylation_CG_TEs_2kb_down.txt"
  bedtools map -a 2kb_downstream_TE.bed -b "${base}.methyl_proportion_no_na_CHG.bed" -c 5 -o mean > \
    updown/"${base}.mean_methylation_CHG_TEs_2kb_down.txt"




done

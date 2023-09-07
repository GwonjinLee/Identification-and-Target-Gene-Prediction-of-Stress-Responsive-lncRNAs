#!/bin/sh -l

#SBATCH --job-name mean_methylation_perwin_distribution_TElinc
#SBATCH -A meixiazhao
#SBATCH --mem=48G
#SBATCH --nodes=2
#SBATCH --ntasks=4
#SBATCH --cpus-per-task=5 
#SBATCH --time=5-0:00
#SBATCH -o /blue/meixiazhao/lee.gwonjin/Soybean_project/scripts/outtext/mean_methylation_perwin_distribution_body.out
#SBATCH -e /blue/meixiazhao/lee.gwonjin/Soybean_project/scripts/outtext/mean_methylation_perwin_distribution_body.err
#SBATCH --mail-type=all          
#SBATCH --mail-user=lee.gwonjin@ufl.edu


# working space
cd /blue/meixiazhao/lee.gwonjin/Soybean_project/lncRNA/methylation/

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



  # Use bedtools map to calculate mean methylation ratio per TE_containlincRNAs for each type
 # Sort input bed files
input_dir="distribution/TElinc"
# Sort each matching input file individually
for file in "$input_dir"/*win.bed
do
  sorted_file="$input_dir/$(basename "${file%.*}_sorted.bed")"
  sort -k1,1 -k2,2n -k3,3n "$file" > "$sorted_file"
done

  # Remove rows with "-" in column 2 or 3 in each sorted file
  for file in "$input_dir"/*_sorted.bed; do
    awk '!/-/' "$file" >"${file%.*}_no_minus.bed"
	rm "$file" 
  done
 
   # Remove rows with the same values in columns 1, 2, and 3
  for file in "$input_dir"/*_sorted_no_minus.bed; do
    awk '!seen[$1,$2,$3]++' "$file" >"${file%.*}_no_duplicates.bed"
	rm "$file" 
  done
  
  # Remove rows where column 2 is greater than column 3
  for file in "$input_dir"/*_no_duplicates.bed; do
    basewin=$(basename "${file}" _sorted_no_minus_no_duplicates.bed)
    awk '$2 < $3' "$file" >"$input_dir/${basewin}.filtered.bed"
	rm "$file" 
  done
    
   
  bedtools map -a distribution/TElinc/TElinc_body_win.filtered.bed -b "${base}.methyl_proportion_no_na_CG.bed" -c 5 -o mean > \
    distribution/TElinc/results/"${base}.mean_methylation_CG_TElinc_body.txt"
  bedtools map -a distribution/TElinc/TElinc_body_win.filtered.bed -b "${base}.methyl_proportion_no_na_CHG.bed" -c 5 -o mean > \
    distribution/TElinc/results/"${base}.mean_methylation_CHG_TElinc_body.txt"
  bedtools map -a distribution/TElinc/TElinc_body_win.filtered.bed -b "${base}.methyl_proportion_no_na_CHH.bed" -c 5 -o mean > \
    distribution/TElinc/results/"${base}.mean_methylation_CHH_TElinc_body.txt"
	
  
done

	



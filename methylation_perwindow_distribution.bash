#!/bin/sh -l

#SBATCH --job-name mean_methylation_perwin_distribution
#SBATCH -A meixiazhao
#SBATCH --mem=48G
#SBATCH --nodes=2
#SBATCH --ntasks=4
#SBATCH --cpus-per-task=5 
#SBATCH --time=5-0:00
#SBATCH -o /blue/meixiazhao/lee.gwonjin/Soybean_project/scripts/outtext/mean_methylation_perwin_distribution.out
#SBATCH -e /blue/meixiazhao/lee.gwonjin/Soybean_project/scripts/outtext/mean_methylation_perwin_distribution.err
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



  # Use bedtools map to calculate mean methylation ratio per gene for each type
 # Sort input bed files
input_dir="distribution/gene"
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
  

  
bedtools map -a distribution/gene/Gmax_508_Wm82.a4.v1.gene.gff3_genes_2kbdown_win.filtered.bed -b "${base}.methyl_proportion_no_na_CG.bed" -c 5 -o mean > \
    distribution/gene/results/"${base}.mean_methylation_CG_gene_2kbdown.txt"
  bedtools map -a distribution/gene/Gmax_508_Wm82.a4.v1.gene.gff3_genes_2kbdown_win.filtered.bed -b "${base}.methyl_proportion_no_na_CHG.bed" -c 5 -o mean > \
    distribution/gene/results/"${base}.mean_methylation_CHG_gene_2kbdown.txt"
  bedtools map -a distribution/gene/Gmax_508_Wm82.a4.v1.gene.gff3_genes_2kbdown_win.filtered.bed -b "${base}.methyl_proportion_no_na_CHH.bed" -c 5 -o mean > \
    distribution/gene/results/"${base}.mean_methylation_CHH_gene_2kbdown.txt"


bedtools map -a distribution/gene/Gmax_508_Wm82.a4.v1.gene.gff3_genes_2kbup_win.filtered.bed -b "${base}.methyl_proportion_no_na_CG.bed" -c 5 -o mean > \
    distribution/gene/results/"${base}.mean_methylation_CG_gene_2kbup.txt"
  bedtools map -a distribution/gene/Gmax_508_Wm82.a4.v1.gene.gff3_genes_2kbup_win.filtered.bed -b "${base}.methyl_proportion_no_na_CHG.bed" -c 5 -o mean > \
    distribution/gene/results/"${base}.mean_methylation_CHG_gene_2kbup.txt"
  bedtools map -a distribution/gene/Gmax_508_Wm82.a4.v1.gene.gff3_genes_2kbup_win.filtered.bed -b "${base}.methyl_proportion_no_na_CHH.bed" -c 5 -o mean > \
    distribution/gene/results/"${base}.mean_methylation_CHH_gene_2kbup.txt"
 
   
  bedtools map -a distribution/gene/Gmax_508_Wm82.a4.v1.gene.gff3_genes_body_win.filtered.bed -b "${base}.methyl_proportion_no_na_CG.bed" -c 5 -o mean > \
    distribution/gene/results/"${base}.mean_methylation_CG_gene_body.txt"
  bedtools map -a distribution/gene/Gmax_508_Wm82.a4.v1.gene.gff3_genes_body_win.filtered.bed -b "${base}.methyl_proportion_no_na_CHG.bed" -c 5 -o mean > \
    distribution/gene/results/"${base}.mean_methylation_CHG_gene_body.txt"
  bedtools map -a distribution/gene/Gmax_508_Wm82.a4.v1.gene.gff3_genes_body_win.filtered.bed -b "${base}.methyl_proportion_no_na_CHH.bed" -c 5 -o mean > \
    distribution/gene/results/"${base}.mean_methylation_CHH_gene_body.txt"
	
  # Use bedtools map to calculate mean methylation ratio per NoTElincRNAs for each type
 # Sort input bed files
input_dir="distribution/noTElinc"
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
   
  
  bedtools map -a distribution/noTElinc/noTElinc_down_win.filtered.bed -b "${base}.methyl_proportion_no_na_CG.bed" -c 5 -o mean > \
    distribution/noTElinc/results/"${base}.mean_methylation_CG_noTElinc_2kbdown.txt"
  bedtools map -a distribution/noTElinc/noTElinc_down_win.filtered.bed -b "${base}.methyl_proportion_no_na_CHG.bed" -c 5 -o mean > \
    distribution/noTElinc/results/"${base}.mean_methylation_CHG_noTElinc_2kbdown.txt"
  bedtools map -a distribution/noTElinc/noTElinc_down_win.filtered.bed -b "${base}.methyl_proportion_no_na_CHH.bed" -c 5 -o mean > \
    distribution/noTElinc/results/"${base}.mean_methylation_CHH_noTElinc_2kbdown.txt"

  bedtools map -a distribution/noTElinc/noTElinc_up_win.filtered.bed -b "${base}.methyl_proportion_no_na_CG.bed" -c 5 -o mean > \
   distribution/noTElinc/results/"${base}.mean_methylation_CG_noTElinc_2kbup.txt"
  bedtools map -a distribution/noTElinc/noTElinc_up_win.filtered.bed -b "${base}.methyl_proportion_no_na_CHG.bed" -c 5 -o mean > \
   distribution/noTElinc/results/"${base}.mean_methylation_CHG_noTElinc_2kbup.txt"
  bedtools map -a distribution/noTElinc/noTElinc_up_win.filtered.bed -b "${base}.methyl_proportion_no_na_CHH.bed" -c 5 -o mean > \
   distribution/noTElinc/results/"${base}.mean_methylation_CHH_noTElinc_2kbup.txt"   
   
  bedtools map -a distribution/noTElinc/noTElinc_body_win.filtered.bed -b "${base}.methyl_proportion_no_na_CG.bed" -c 5 -o mean > \
    distribution/noTElinc/results/"${base}.mean_methylation_CG_noTElinc_body.txt"
  bedtools map -a distribution/noTElinc/noTElinc_body_win.filtered.bed -b "${base}.methyl_proportion_no_na_CHG.bed" -c 5 -o mean > \
    distribution/noTElinc/results/"${base}.mean_methylation_CHG_noTElinc_body.txt"
  bedtools map -a distribution/noTElinc/noTElinc_body_win.filtered.bed -b "${base}.methyl_proportion_no_na_CHH.bed" -c 5 -o mean > \
    distribution/noTElinc/results/"${base}.mean_methylation_CHH_noTElinc_body.txt"
	

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
    
  bedtools map -a distribution/TElinc/TElinc_down_win.filtered.bed -b "${base}.methyl_proportion_no_na_CG.bed" -c 5 -o mean > \
    distribution/TElinc/results/"${base}.mean_methylation_CG_TElinc_2kbdown.txt"
  bedtools map -a distribution/TElinc/TElinc_down_win.filtered.bed -b "${base}.methyl_proportion_no_na_CHG.bed" -c 5 -o mean > \
    distribution/TElinc/results/"${base}.mean_methylation_CHG_TElinc_2kbdown.txt"
  bedtools map -a distribution/TElinc/TElinc_down_win.filtered.bed -b "${base}.methyl_proportion_no_na_CHH.bed" -c 5 -o mean > \
    distribution/TElinc/results/"${base}.mean_methylation_CHH_TElinc_2kbdown.txt"

  bedtools map -a distribution/TElinc/TElinc_up_win.filtered.bed -b "${base}.methyl_proportion_no_na_CG.bed" -c 5 -o mean > \
   distribution/TElinc/results/"${base}.mean_methylation_CG_TElinc_2kbup.txt"
  bedtools map -a distribution/TElinc/TElinc_up_win.filtered.bed -b "${base}.methyl_proportion_no_na_CHG.bed" -c 5 -o mean > \
   distribution/TElinc/results/"${base}.mean_methylation_CHG_TElinc_2kbup.txt"
  bedtools map -a distribution/TElinc/TElinc_up_win.filtered.bed -b "${base}.methyl_proportion_no_na_CHH.bed" -c 5 -o mean > \
   distribution/TElinc/results/"${base}.mean_methylation_CHH_TElinc_2kbup.txt"   
   
  bedtools map -a distribution/TElinc/TElinc_body_win.filtered.bed -b "${base}.methyl_proportion_no_na_CG.bed" -c 5 -o mean > \
    distribution/TElinc/results/"${base}.mean_methylation_CG_TElinc_body.txt"
  bedtools map -a distribution/TElinc/TElinc_body_win.filtered.bed -b "${base}.methyl_proportion_no_na_CHG.bed" -c 5 -o mean > \
    distribution/TElinc/results/"${base}.mean_methylation_CHG_TElinc_body.txt"
  bedtools map -a distribution/TElinc/TElinc_body_win.filtered.bed -b "${base}.methyl_proportion_no_na_CHH.bed" -c 5 -o mean > \
    distribution/TElinc/results/"${base}.mean_methylation_CHH_TElinc_body.txt"
	
	
	
  # Use bedtools map to calculate mean methylation ratio per TE for each type
 # Sort input bed files
input_dir="distribution/TE"
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
   
  bedtools map -a distribution/TE/TE_down_win.filtered.bed -b "${base}.methyl_proportion_no_na_CG.bed" -c 5 -o mean > \
    distribution/TE/results/"${base}.mean_methylation_CG_TE_2kbdown.txt"
  bedtools map -a distribution/TE/TE_down_win.filtered.bed -b "${base}.methyl_proportion_no_na_CHG.bed" -c 5 -o mean > \
    distribution/TE/results/"${base}.mean_methylation_CHG_TE_2kbdown.txt"
  bedtools map -a distribution/TE/TE_down_win.filtered.bed -b "${base}.methyl_proportion_no_na_CHH.bed" -c 5 -o mean > \
    distribution/TE/results/"${base}.mean_methylation_CHH_TE_2kbdown.txt"

  bedtools map -a distribution/TE/TE_up_win.filtered.bed -b "${base}.methyl_proportion_no_na_CG.bed" -c 5 -o mean > \
   distribution/TE/results/"${base}.mean_methylation_CG_TE_2kbup.txt"
  bedtools map -a distribution/TE/TE_up_win.filtered.bed -b "${base}.methyl_proportion_no_na_CHG.bed" -c 5 -o mean > \
   distribution/TE/results/"${base}.mean_methylation_CHG_TE_2kbup.txt"
  bedtools map -a distribution/TE/TE_up_win.filtered.bed -b "${base}.methyl_proportion_no_na_CHH.bed" -c 5 -o mean > \
   distribution/TE/results/"${base}.mean_methylation_CHH_TE_2kbup.txt"   
   
  bedtools map -a distribution/TE/TE_body_win.filtered.bed -b "${base}.methyl_proportion_no_na_CG.bed" -c 5 -o mean > \
    distribution/TE/results/"${base}.mean_methylation_CG_TE_body.txt"
  bedtools map -a distribution/TE/TE_body_win.filtered.bed -b "${base}.methyl_proportion_no_na_CHG.bed" -c 5 -o mean > \
    distribution/TE/results/"${base}.mean_methylation_CHG_TE_body.txt"
  bedtools map -a distribution/TE/TE_body_win.filtered.bed -b "${base}.methyl_proportion_no_na_CHH.bed" -c 5 -o mean > \
    distribution/TE/results/"${base}.mean_methylation_CHH_TE_body.txt"
	
	
  
done

	



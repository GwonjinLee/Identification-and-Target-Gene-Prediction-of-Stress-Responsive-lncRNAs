#!/bin/sh -l

#SBATCH --job-name methyl_extract_region 
#SBATCH -A meixiazhao
#SBATCH --mem=36G
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=2
#SBATCH --time=3-0:00
#SBATCH -o /blue/meixiazhao/lee.gwonjin/Soybean_project/scripts/outtext/methyl_extract_region.out
#SBATCH -e /blue/meixiazhao/lee.gwonjin/Soybean_project/scripts/outtext/methyl_extract_region.err
#SBATCH --mail-type=all          
#SBATCH --mail-user=lee.gwonjin@ufl.edu



#working space
cd /blue/meixiazhao/lee.gwonjin/Soybean_project/lncRNA/methylation


range_start=5252464
range_end=5269003

for file in *.txt; do
    output_file="${file%.*}_extracted.txt"
    awk -v start=$range_start -v end=$range_end '$1 == "Gm03" && $2 >= start && $2 <= end' "$file" > "$output_file"
done


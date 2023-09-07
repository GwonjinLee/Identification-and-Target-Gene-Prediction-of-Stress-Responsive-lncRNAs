#!/bin/sh -l

#SBATCH --job-name cuffmerge
#SBATCH -A meixiazhao
#SBATCH --mem=32G
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=4
#SBATCH --cpus-per-task=2 
#SBATCH --time=7-0:00
#SBATCH -o /blue/meixiazhao/lee.gwonjin/Soybean_project/scripts/outtext/cuffmerge.out
#SBATCH -e /blue/meixiazhao/lee.gwonjin/Soybean_project/scripts/outtext/cuffmerge.err
#SBATCH --mail-type=end          
#SBATCH --mail-user=lee.gwonjin@ufl.edu

#working space
cd /blue/meixiazhao/lee.gwonjin/Soybean_project/lncRNA/mapping/assembly

module load cufflinks


# merge each of transcript assemblies to one single gtf
cuffmerge -p 8 \
-s /blue/meixiazhao/lee.gwonjin/Soybean_project/reference/genome/PhytozomeV13/Gmax/Wm82.a4.v1/assembly/Gmax_508_v4.0.fa \
-g /blue/meixiazhao/lee.gwonjin/Soybean_project/reference/genome/PhytozomeV13/Gmax/Wm82.a4.v1/annotation/Gmax_508_Wm82.a4.v1.gene.gff3 \
Soy_assembly.txt
  
# Add the original gtf if necessary
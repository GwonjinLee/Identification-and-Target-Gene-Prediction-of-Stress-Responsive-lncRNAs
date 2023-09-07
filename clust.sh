#!/bin/sh -l

#SBATCH --job-name clust
#SBATCH -A meixiazhao
#SBATCH --mem=12G
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=2
#SBATCH --cpus-per-task=2
#SBATCH --time=7-0:00
#SBATCH -o /blue/meixiazhao/lee.gwonjin/Soybean_project/scripts/outtext/clust.out
#SBATCH -e /blue/meixiazhao/lee.gwonjin/Soybean_project/scripts/outtext/clust.err
#SBATCH --mail-type=end          
#SBATCH --mail-user=lee.gwonjin@ufl.edu

module load python

#working space
cd /blue/meixiazhao/lee.gwonjin/Soybean_project/clust/clust-1.18.1


## T = 6
#Run clust for cf
mkdir ../results/cf6

python clust.py ../cf.txt \
-n 1000 \
-r ../replicate_cf.txt \
-t 6 \
-fil-v 3 \
-fil-c 1 \
-o ../results/cf6

#Run clust for ne
mkdir ../results/ne6

python clust.py ../ne.txt \
-n 1000 \
-r ../replicate_ne.txt \
-t 6 \
-fil-v 3 \
-fil-c 1 \
-o ../results/ne6

#Run clust for wm
mkdir ../results/wm6

python clust.py ../wm.txt \
-n 1000 \
-r ../replicate_wm.txt \
-t 6 \
-fil-v 3 \
-fil-c 1 \
-o ../results/wm6

#Run clust for sk
mkdir ../results/sk6

python clust.py ../sk.txt \
-n 1000 \
-r ../replicate_sk.txt \
-t 6 \
-fil-v 3 \
-fil-c 1 \
-o ../results/sk6


#############################


## T = 7
#Run clust for cf
mkdir ../results/cf7

python clust.py ../cf.txt \
-n 1000 \
-r ../replicate_cf.txt \
-t 7 \
-fil-v 3 \
-fil-c 1 \
-o ../results/cf7

#Run clust for ne
mkdir ../results/ne7

python clust.py ../ne.txt \
-n 1000 \
-r ../replicate_ne.txt \
-t 7 \
-fil-v 3 \
-fil-c 1 \
-o ../results/ne7

#Run clust for wm
mkdir ../results/wm7

python clust.py ../wm.txt \
-n 1000 \
-r ../replicate_wm.txt \
-t 7 \
-fil-v 3 \
-fil-c 1 \
-o ../results/wm7

#Run clust for sk
mkdir ../results/sk7

python clust.py ../sk.txt \
-n 1000 \
-r ../replicate_sk.txt \
-t 7 \
-fil-v 3 \
-fil-c 1 \
-o ../results/sk7
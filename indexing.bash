
#PBS -N indexing
#PBS -A PMIU0157
#PBS -e /fs/project/PMIU0157/Gwonjin_Lee/Soybean_project/scripts/outtext/indexing.err
#PBS -o /fs/project/PMIU0157/Gwonjin_Lee/Soybean_project/scripts/outtext/indexing.out
#PBS -q serial
#PBS -l nodes=1:ppn=8
#PBS -l walltime=24:00:00
#PBS -r y

#working space
cd /fs/project/PMIU0157/Gwonjin_Lee/Soybean_project/reference/genome/PhytozomeV13/Gmax/Wm82.a4.v1/assembly

module load hisat2/2.1.0

# unzip fasta file
gzip -d Gmax_508_v4.0.fa.gz

# indexing 
hisat2-build -f Gmax_508_v4.0.fa \
/fs/project/PMIU0157/Gwonjin_Lee/Soybean_project/reference/genome/PhytozomeV13/Gmax/Index/GmaxIndex


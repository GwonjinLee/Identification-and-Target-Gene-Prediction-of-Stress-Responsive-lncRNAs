
#PBS -N trimming2
#PBS -A PMIU0157
#PBS -e /fs/project/PMIU0157/Gwonjin_Lee/Soybean_project/scripts/outtext/trimming_v2.err
#PBS -o /fs/project/PMIU0157/Gwonjin_Lee/Soybean_project/scripts/outtext/trimming_v2.out
#PBS -q serial
#PBS -l nodes=1:ppn=8
#PBS -l walltime=6:00:00
#PBS -r y

#working space
cd /fs/project/PMIU0157/Bei_Liu/soybean_project/raw_data/raw_data/add

module load trimmomatic
module load trimmomatic/0.36

# Trimming loop for multiple raw files

for infile in *.fq.gz 
    do base=$(basename ${infile} _R1.fq.gz) 
    java -jar /usr/local/trimmomatic/Trimmomatic-0.36/trimmomatic-0.36.jar PE -threads 16 -phred33 \
	${infile} \
	${base}_R2.fq.gz \
	/fs/project/PMIU0157/Gwonjin_Lee/Soybean_project/trimming/trimmed/${base}_R1_paired_trim.fq.gz \
	/fs/project/PMIU0157/Gwonjin_Lee/Soybean_project/trimming/trimmed/${base}_R1_unpaired_trim.fq.gz \
	/fs/project/PMIU0157/Gwonjin_Lee/Soybean_project/trimming/trimmed/${base}_R2_paired_trim.fq.gz \
	/fs/project/PMIU0157/Gwonjin_Lee/Soybean_project/trimming/trimmed/${base}_R2_unpaired_trim.fq.gz \
	ILLUMINACLIP:/usr/local/trimmomatic/Trimmomatic-0.36/adapters/TruSeq3-PE.fa:2:30:10 \
	LEADING:3 TRAILING:3 SLIDINGWINDOW:4:20 MINLEN:75
    done



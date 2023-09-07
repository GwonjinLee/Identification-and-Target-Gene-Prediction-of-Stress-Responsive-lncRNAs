#!/bin/sh -l

#SBATCH --job-name NCBI_GEO_sub
#SBATCH -A meixiazhao
#SBATCH --mem=24G
#SBATCH --nodes=2
#SBATCH --ntasks=2
#SBATCH --cpus-per-task=3 
#SBATCH --time=5-0:00
#SBATCH -o /blue/meixiazhao/lee.gwonjin/Soybean_project/scripts/outtext/NCBI_GEO_sub.out
#SBATCH -e /blue/meixiazhao/lee.gwonjin/Soybean_project/scripts/outtext/NCBI_GEO_sub.err
#SBATCH --mail-type=all          
#SBATCH --mail-user=lee.gwonjin@ufl.edu


# working space
cd /orange/meixiazhao/lee.gwonjin/Soybean_project

module load ncftp

ncftp
set passive on
set so-bufsize 33554432
open ftp://geoftp:inAlwokhodAbnib5@ftp-private.ncbi.nlm.nih.gov
cd uploads/lee.gwonjin@ufl.edu_ebuhMWoC
put -R NCBI_GEO_Lee_081523



#if not working, use the terminal
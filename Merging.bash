#!/bin/bash 
  
#PBS -N merging
#PBS -A PMIU0157
#PBS -e /fs/project/PMIU0157/Gwonjin_Lee/Soybean_project/trimming/outtext/merging.err
#PBS -o /fs/project/PMIU0157/Gwonjin_Lee/Soybean_project/trimming/outtext/merging.out
#PBS -q serial
#PBS -l nodes=1:ppn=8
#PBS -l walltime=24:00:00
#PBS -r y

#working space
cd /fs/project/PMIU0157/Bei_Liu/soybean_project/raw_data/raw_data




#Merge files for each sample containing a couple of split files

cat wm_16ht2_CRRA200004918-1a_HV53CDSXX_L2_2.fq.gz wm_16ht2_CRRA200004918-1a_H57J7DSXY_L2_2.fq.gz > wm_16ht2_R2.fq.gz
mv wm_16ht2_CRRA200004918-1a_HV53CDSXX_L2_2.fq.gz wm_16ht2_CRRA200004918-1a_H57J7DSXY_L2_2.fq.gz split_files/

cat ne_8ht2_CRRA200004935-1a_HTL3WDSXX_L1_1.fq.gz ne_8ht2_CRRA200004935-1a_HV53CDSXX_L2_1.fq.gz > ne_8ht2_R1.fq.gz
mv ne_8ht2_CRRA200004935-1a_HTL3WDSXX_L1_1.fq.gz ne_8ht2_CRRA200004935-1a_HV53CDSXX_L2_1.fq.gz split_files/

cat ne_8ht2_CRRA200004935-1a_HV53CDSXX_L2_2.fq.gz ne_8ht2_CRRA200004935-1a_HTL3WDSXX_L1_2.fq.gz > ne_8ht2_R2.fq.gz
mv ne_8ht2_CRRA200004935-1a_HV53CDSXX_L2_2.fq.gz ne_8ht2_CRRA200004935-1a_HTL3WDSXX_L1_2.fq.gz split_files/

cat cf_16hc3_CRRA200004905-1a_H57J7DSXY_L2_1.fq.gz cf_16hc3_CRRA200004905-1a_HV53CDSXX_L1_1.fq.gz > cf_16hc3_R1.fq.gz
mv cf_16hc3_CRRA200004905-1a_H57J7DSXY_L2_1.fq.gz cf_16hc3_CRRA200004905-1a_HV53CDSXX_L1_1.fq.gz split_files/


cat cf_16hc3_CRRA200004905-1a_HV53CDSXX_L1_2.fq.gz cf_16hc3_CRRA200004905-1a_H57J7DSXY_L2_2.fq.gz > cf_16hc3_R2.fq.gz
mv cf_16hc3_CRRA200004905-1a_HV53CDSXX_L1_2.fq.gz cf_16hc3_CRRA200004905-1a_H57J7DSXY_L2_2.fq.gz split_files/


cat cf_16ht3_CRRA200004909-1a_H57J7DSXY_L2_1.fq.gz cf_16ht3_CRRA200004909-1a_HV53CDSXX_L1_1.fq.gz > cf_16ht3_R1.fq.gz
mv cf_16ht3_CRRA200004909-1a_H57J7DSXY_L2_1.fq.gz cf_16ht3_CRRA200004909-1a_HV53CDSXX_L1_1.fq.gz split_files/


cat cf_16ht3_CRRA200004909-1a_HV53CDSXX_L1_2.fq.gz cf_16ht3_CRRA200004909-1a_H57J7DSXY_L2_2.fq.gz > cf_16ht3_R2.fq.gz
mv cf_16ht3_CRRA200004909-1a_HV53CDSXX_L1_2.fq.gz cf_16ht3_CRRA200004909-1a_H57J7DSXY_L2_2.fq.gz split_files/


cat cf_2hc2_CRRA200004894-1a_H57J7DSXY_L2_1.fq.gz cf_2hc2_CRRA200004894-1a_HV53CDSXX_L2_1.fq.gz > cf_2hc2_R1.fq.gz
mv cf_2hc2_CRRA200004894-1a_H57J7DSXY_L2_1.fq.gz cf_2hc2_CRRA200004894-1a_HV53CDSXX_L2_1.fq.gz split_files/


cat cf_2hc2_CRRA200004894-1a_HV53CDSXX_L2_2.fq.gz cf_2hc2_CRRA200004894-1a_H57J7DSXY_L2_2.fq.gz > cf_2hc2_R2.fq.gz
mv cf_2hc2_CRRA200004894-1a_HV53CDSXX_L2_2.fq.gz cf_2hc2_CRRA200004894-1a_H57J7DSXY_L2_2.fq.gz split_files/

cat cf_2ht3_CRRA200004906-1a_H57J7DSXY_L2_1.fq.gz cf_2ht3_CRRA200004906-1a_HV53CDSXX_L1_1.fq.gz > cf_2ht3_R1.fq.gz
mv cf_2ht3_CRRA200004906-1a_H57J7DSXY_L2_1.fq.gz cf_2ht3_CRRA200004906-1a_HV53CDSXX_L1_1.fq.gz split_files/

cat cf_2ht3_CRRA200004906-1a_HV53CDSXX_L1_2.fq.gz cf_2ht3_CRRA200004906-1a_H57J7DSXY_L2_2.fq.gz > cf_2ht3_R2.fq.gz
mv cf_2ht3_CRRA200004906-1a_HV53CDSXX_L1_2.fq.gz cf_2ht3_CRRA200004906-1a_H57J7DSXY_L2_2.fq.gz split_files/


cat cf_4hc3_CRRA200004903-1a_H57J7DSXY_L2_1.fq.gz cf_4hc3_CRRA200004903-1a_HV53CDSXX_L2_1.fq.gz > cf_4hc3_R1.fq.gz
mv cf_4hc3_CRRA200004903-1a_H57J7DSXY_L2_1.fq.gz cf_4hc3_CRRA200004903-1a_HV53CDSXX_L2_1.fq.gz split_files/

cat cf_4hc3_CRRA200004903-1a_HV53CDSXX_L2_2.fq.gz cf_4hc3_CRRA200004903-1a_H57J7DSXY_L2_2.fq.gz > cf_4hc3_R2.fq.gz
mv cf_4hc3_CRRA200004903-1a_HV53CDSXX_L2_2.fq.gz cf_4hc3_CRRA200004903-1a_H57J7DSXY_L2_2.fq.gz split_files/


cat cf_4ht2_CRRA200004899-1a_H57J7DSXY_L2_1.fq.gz cf_4ht2_CRRA200004899-1a_HV53CDSXX_L2_1.fq.gz > cf_4ht2_R1.fq.gz
mv cf_4ht2_CRRA200004899-1a_H57J7DSXY_L2_1.fq.gz cf_4ht2_CRRA200004899-1a_HV53CDSXX_L2_1.fq.gz split_files/

cat cf_4ht2_CRRA200004899-1a_HV53CDSXX_L2_2.fq.gz cf_4ht2_CRRA200004899-1a_H57J7DSXY_L2_2.fq.gz > cf_4ht2_R2.fq.gz
mv cf_4ht2_CRRA200004899-1a_HV53CDSXX_L2_2.fq.gz cf_4ht2_CRRA200004899-1a_H57J7DSXY_L2_2.fq.gz split_files/


cat cf_4ht3_CRRA200004907-1a_H57J7DSXY_L2_1.fq.gz cf_4ht3_CRRA200004907-1a_HV53CDSXX_L1_1.fq.gz > cf_4ht3_R1.fq.gz
mv cf_4ht3_CRRA200004907-1a_H57J7DSXY_L2_1.fq.gz cf_4ht3_CRRA200004907-1a_HV53CDSXX_L1_1.fq.gz split_files/


cat cf_4ht3_CRRA200004907-1a_HV53CDSXX_L1_2.fq.gz cf_4ht3_CRRA200004907-1a_H57J7DSXY_L2_2.fq.gz > cf_4ht3_R2.fq.gz
mv cf_4ht3_CRRA200004907-1a_HV53CDSXX_L1_2.fq.gz cf_4ht3_CRRA200004907-1a_H57J7DSXY_L2_2.fq.gz split_files/


cat cf_8hc2_CRRA200004896-1a_H57J7DSXY_L2_1.fq.gz cf_8hc2_CRRA200004896-1a_HV53CDSXX_L2_1.fq.gz > cf_8hc2_R1.fq.gz
mv cf_8hc2_CRRA200004896-1a_H57J7DSXY_L2_1.fq.gz cf_8hc2_CRRA200004896-1a_HV53CDSXX_L2_1.fq.gz split_files/


cat cf_8hc2_CRRA200004896-1a_HV53CDSXX_L2_2.fq.gz cf_8hc2_CRRA200004896-1a_H57J7DSXY_L2_2.fq.gz > cf_8hc2_R2.fq.gz
mv cf_8hc2_CRRA200004896-1a_HV53CDSXX_L2_2.fq.gz cf_8hc2_CRRA200004896-1a_H57J7DSXY_L2_2.fq.gz split_files/


cat cf_8ht3_CRRA200004908-1a_H57J7DSXY_L2_1.fq.gz cf_8ht3_CRRA200004908-1a_HV53CDSXX_L1_1.fq.gz > cf_8ht3_R1.fq.gz
mv cf_8ht3_CRRA200004908-1a_H57J7DSXY_L2_1.fq.gz cf_8ht3_CRRA200004908-1a_HV53CDSXX_L1_1.fq.gz split_files/

cat cf_8ht3_CRRA200004908-1a_HV53CDSXX_L1_2.fq.gz cf_8ht3_CRRA200004908-1a_H57J7DSXY_L2_2.fq.gz > cf_8ht3_R2.fq.gz
mv cf_8ht3_CRRA200004908-1a_HV53CDSXX_L1_2.fq.gz cf_8ht3_CRRA200004908-1a_H57J7DSXY_L2_2.fq.gz split_files/


cat cf_16hc2_CRRA200004897-1a_H57J7DSXY_L2_1.fq.gz cf_16hc2_CRRA200004897-1a_HV2YJDSXX_L1_1.fq.gz cf_16hc2_CRRA200004897-1a_HV53CDSXX_L2_1.fq.gz > cf_16hc2_R1.fq.gz
mv cf_16hc2_CRRA200004897-1a_H57J7DSXY_L2_1.fq.gz cf_16hc2_CRRA200004897-1a_HV2YJDSXX_L1_1.fq.gz cf_16hc2_CRRA200004897-1a_HV53CDSXX_L2_1.fq.gz split_files/


cat cf_16hc2_CRRA200004897-1a_HV53CDSXX_L2_2.fq.gz cf_16hc2_CRRA200004897-1a_H57J7DSXY_L2_2.fq.gz cf_16hc2_CRRA200004897-1a_HV2YJDSXX_L1_2.fq.gz > cf_16hc2_R2.fq.gz
mv cf_16hc2_CRRA200004897-1a_HV53CDSXX_L2_2.fq.gz cf_16hc2_CRRA200004897-1a_H57J7DSXY_L2_2.fq.gz cf_16hc2_CRRA200004897-1a_HV2YJDSXX_L1_2.fq.gz split_files/

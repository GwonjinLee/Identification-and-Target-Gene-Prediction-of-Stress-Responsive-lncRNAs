#!/bin/bash 
  
#PBS -N renaming
#PBS -A PMIU0157
#PBS -e /fs/project/PMIU0157/Gwonjin_Lee/Soybean_project/trimming/outtext/renaming.err
#PBS -o /fs/project/PMIU0157/Gwonjin_Lee/Soybean_project/trimming/outtext/renaming.out
#PBS -q serial
#PBS -l nodes=1:ppn=8
#PBS -l walltime=24:00:00
#PBS -r y

#working space
cd /fs/project/PMIU0157/Bei_Liu/soybean_project/raw_data/raw_data

mv cf_2hc3_CRRA200004902-1a_H57J7DSXY_L2_1.fq.gz cf_2hc3_R1.fq.gz
mv cf_2hc3_CRRA200004902-1a_H57J7DSXY_L2_2.fq.gz cf_2hc3_R2.fq.gz
mv cf_2ht2_CRRA200004898-1a_H57J7DSXY_L2_1.fq.gz cf_2ht2_R1.fq.gz

mv cf_2ht2_CRRA200004898-1a_H57J7DSXY_L2_2.fq.gz cf_2ht2_R2.fq.gz

mv cf_8ht2_CRRA200004900-1a_H57J7DSXY_L2_1.fq.gz cf_8ht2_R1.fq.gz

mv cf_8ht2_CRRA200004900-1a_H57J7DSXY_L2_2.fq.gz cf_8ht2_R2.fq.gz

mv ne_16hc2_CRRA200004931-1a_HTL3WDSXX_L1_1.fq.gz ne_16hc2_R1.fq.gz

mv ne_16hc2_CRRA200004931-1a_HTL3WDSXX_L1_2.fq.gz ne_16hc2_R2.fq.gz

mv ne_16hc3_CRRA200004941-1a_HTL3WDSXX_L1_1.fq.gz ne_16hc3_R1.fq.gz

mv ne_16hc3_CRRA200004941-1a_HTL3WDSXX_L1_2.fq.gz ne_16hc3_R2.fq.gz

mv ne_16ht2_CRRA200004936-1a_HTL3WDSXX_L1_1.fq.gz ne_16ht2_R1.fq.gz

mv ne_16ht2_CRRA200004936-1a_HTL3WDSXX_L1_2.fq.gz ne_16ht2_R2.fq.gz

mv ne_16ht3_CRRA200004945-1a_HTL3WDSXX_L1_1.fq.gz ne_16ht3_R1.fq.gz

mv ne_16ht3_CRRA200004945-1a_HTL3WDSXX_L1_2.fq.gz ne_16ht3_R2.fq.gz

mv ne_2hc2_CRRA200004927-1a_HTL3WDSXX_L1_1.fq.gz ne_2hc2_R1.fq.gz

mv ne_2hc2_CRRA200004927-1a_HTL3WDSXX_L1_2.fq.gz ne_2hc2_R2.fq.gz

mv ne_2hc3_CRRA200004937-1a_HTL3WDSXX_L1_1.fq.gz ne_2hc3_R1.fq.gz

mv ne_2hc3_CRRA200004937-1a_HTL3WDSXX_L1_2.fq.gz ne_2hc3_R2.fq.gz

mv ne_2ht2_CRRA200004932-1a_HTL3WDSXX_L1_1.fq.gz ne_2ht2_R1.fq.gz

mv ne_2ht2_CRRA200004932-1a_HTL3WDSXX_L1_2.fq.gz ne_2ht2_R2.fq.gz

mv ne_2ht3_CRRA200004942-1a_HTL3WDSXX_L1_1.fq.gz ne_2ht3_R1.fq.gz

mv ne_2ht3_CRRA200004942-1a_HTL3WDSXX_L1_2.fq.gz ne_2ht3_R2.fq.gz

mv ne_4hc2a_CRRA200004928-1a_HTL3WDSXX_L1_1.fq.gz ne_4hc2_R1.fq.gz

mv ne_4hc2a_CRRA200004928-1a_HTL3WDSXX_L1_2.fq.gz ne_4hc2_R2.fq.gz

mv ne_4hc3_CRRA200004938-1a_HTL3WDSXX_L1_1.fq.gz ne_4hc3_R1.fq.gz

mv ne_4hc3_CRRA200004938-1a_HTL3WDSXX_L1_2.fq.gz ne_4hc3_R2.fq.gz
mv ne_4ht2b_CRRA200004934-1a_HTL3WDSXX_L1_1.fq.gz ne_4ht2_R1.fq.gz


mv ne_4ht2b_CRRA200004934-1a_HTL3WDSXX_L1_2.fq.gz ne_4ht2_R2.fq.gz
mv ne_4ht3_CRRA200004943-1a_HTL3WDSXX_L1_1.fq.gz ne_4ht3_R1.fq.gz
mv ne_4ht3_CRRA200004943-1a_HTL3WDSXX_L1_2.fq.gz ne_4ht3_R2.fq.gz
mv ne_8hc2_CRRA200004930-1a_HTL3WDSXX_L1_1.fq.gz ne_8hc2_R1.fq.gz
mv ne_8hc2_CRRA200004930-1a_HTL3WDSXX_L1_2.fq.gz ne_8hc2_R2.fq.gz
 
mv ne_8ht3_CRRA200004944-1a_HTL3WDSXX_L1_1.fq.gz ne_8ht3_R1.fq.gz
mv ne_8ht3_CRRA200004944-1a_HTL3WDSXX_L1_2.fq.gz ne_8ht3_R2.fq.gz
 
mv sk_16hc2_CRRA200004949-1a_HTL3WDSXX_L1_1.fq.gz sk_16hc2_R1.fq.gz
mv sk_16hc2_CRRA200004949-1a_HTL3WDSXX_L1_2.fq.gz sk_16hc2_R2.fq.gz
mv sk_16hc3_CRRA200004957-1a_HTL3WDSXX_L1_1.fq.gz sk_16hc3_R1.fq.gz
mv sk_16hc3_CRRA200004957-1a_HTL3WDSXX_L1_2.fq.gz sk_16hc3_R2.fq.gz
mv sk_16ht2_CRRA200004953-1a_HTL3WDSXX_L1_1.fq.gz sk_16ht2_R1.fq.gz
mv sk_16ht2_CRRA200004953-1a_HTL3WDSXX_L1_2.fq.gz sk_16ht2_R2.fq.gz
mv sk_16ht3_CRRA200004961-1a_HTL3WDSXX_L1_1.fq.gz sk_16ht3_R1.fq.gz
mv sk_16ht3_CRRA200004961-1a_HTL3WDSXX_L1_2.fq.gz sk_16ht3_R2.fq.gz
mv sk_2hc2_CRRA200004946-1a_HTL3WDSXX_L1_1.fq.gz sk_2hc2_R1.fq.gz
mv sk_2hc2_CRRA200004946-1a_HTL3WDSXX_L1_2.fq.gz sk_2hc2_R2.fq.gz
mv sk_2hc3_CRRA200004954-1a_HTL3WDSXX_L1_1.fq.gz sk_2hc3_R1.fq.gz
mv sk_2hc3_CRRA200004954-1a_HTL3WDSXX_L1_2.fq.gz sk_2hc3_R2.fq.gz
mv sk_2ht2_CRRA200004950-1a_HTL3WDSXX_L1_1.fq.gz sk_2ht2_R1.fq.gz
mv sk_2ht2_CRRA200004950-1a_HTL3WDSXX_L1_2.fq.gz sk_2ht2_R2.fq.gz
mv sk_2ht3_CRRA200004958-1a_HTL3WDSXX_L1_1.fq.gz sk_2ht3_R1.fq.gz
mv sk_2ht3_CRRA200004958-1a_HTL3WDSXX_L1_2.fq.gz sk_2ht3_R2.fq.gz
mv sk_4hc2_CRRA200004947-1a_HTL3WDSXX_L1_1.fq.gz sk_4hc2_R1.fq.gz
mv sk_4hc2_CRRA200004947-1a_HTL3WDSXX_L1_2.fq.gz sk_4hc2_R2.fq.gz
mv sk_4hc3_CRRA200004955-1a_HTL3WDSXX_L1_1.fq.gz sk_4hc3_R1.fq.gz
mv sk_4hc3_CRRA200004955-1a_HTL3WDSXX_L1_2.fq.gz sk_4hc3_R2.fq.gz
mv sk_4ht2_CRRA200004951-1a_HTL3WDSXX_L1_1.fq.gz sk_4ht2_R1.fq.gz
mv sk_4ht2_CRRA200004951-1a_HTL3WDSXX_L1_2.fq.gz sk_4ht2_R2.fq.gz
mv sk_8hc2_CRRA200004948-1a_HTL3WDSXX_L1_1.fq.gz sk_8hc2_R1.fq.gz
mv sk_8hc2_CRRA200004948-1a_HTL3WDSXX_L1_2.fq.gz sk_8hc2_R2.fq.gz
mv sk_8hc3_CRRA200004956-1a_HTL3WDSXX_L1_1.fq.gz sk_8hc3_R1.fq.gz
mv sk_8hc3_CRRA200004956-1a_HTL3WDSXX_L1_2.fq.gz sk_8hc3_R2.fq.gz
mv sk_8ht2_CRRA200004952-1a_HTL3WDSXX_L1_1.fq.gz sk_8ht2_R1.fq.gz
mv sk_8ht2_CRRA200004952-1a_HTL3WDSXX_L1_2.fq.gz sk_8ht2_R2.fq.gz
mv sk_8ht3_CRRA200004960-1a_HTL3WDSXX_L1_1.fq.gz sk_8ht3_R1.fq.gz
mv sk_8ht3_CRRA200004960-1a_HTL3WDSXX_L1_2.fq.gz sk_8ht3_R2.fq.gz
 
mv wm_16hc2_CRRA200004913-1a_H57J7DSXY_L2_1.fq.gz wm_16hc2_R1.fq.gz
mv wm_16hc2_CRRA200004913-1a_H57J7DSXY_L2_2.fq.gz wm_16hc2_R2.fq.gz
mv wm_16hc3_CRRA200004922-1a_HTL3WDSXX_L1_1.fq.gz wm_16hc3_R1.fq.gz
mv wm_16hc3_CRRA200004922-1a_HTL3WDSXX_L1_2.fq.gz wm_16hc3_R2.fq.gz
 
mv wm_16ht3_CRRA200004926-1a_HTL3WDSXX_L1_1.fq.gz wm_16ht3_R1.fq.gz
mv wm_16ht3_CRRA200004926-1a_HTL3WDSXX_L1_2.fq.gz wm_16ht3_R2.fq.gz
 
mv wm_2hc3_CRRA200004919-1a_H57J7DSXY_L2_1.fq.gz wm_2hc3_R1.fq.gz
mv wm_2hc3_CRRA200004919-1a_H57J7DSXY_L2_2.fq.gz wm_2hc3_R2.fq.gz
mv wm_2ht3_CRRA200004923-1a_HTL3WDSXX_L1_1.fq.gz wm_2ht3_R1.fq.gz
mv wm_2ht3_CRRA200004923-1a_HTL3WDSXX_L1_2.fq.gz wm_2ht3_R2.fq.gz
mv wm_4hc2_CRRA200004911-1a_H57J7DSXY_L2_1.fq.gz wm_4hc2_R1.fq.gz
mv wm_4hc2_CRRA200004911-1a_H57J7DSXY_L2_2.fq.gz wm_4hc2_R2.fq.gz
mv wm_4hc3_CRRA200004920-1a_HTL3WDSXX_L1_1.fq.gz wm_4hc3_R1.fq.gz
mv wm_4hc3_CRRA200004920-1a_HTL3WDSXX_L1_2.fq.gz wm_4hc3_R2.fq.gz
mv wm_4ht2_CRRA200004916-1a_H57J7DSXY_L2_1.fq.gz wm_4ht2_R1.fq.gz
mv wm_4ht2_CRRA200004916-1a_H57J7DSXY_L2_2.fq.gz wm_4ht2_R2.fq.gz
mv wm_4ht3_CRRA200004924-1a_HTL3WDSXX_L1_1.fq.gz wm_4ht3_R1.fq.gz
mv wm_4ht3_CRRA200004924-1a_HTL3WDSXX_L1_2.fq.gz wm_4ht3_R2.fq.gz
mv wm_8hc3_CRRA200004921-1a_HTL3WDSXX_L1_1.fq.gz wm_8hc3_R1.fq.gz
mv wm_8hc3_CRRA200004921-1a_HTL3WDSXX_L1_2.fq.gz wm_8hc3_R2.fq.gz
mv wm_8ht2_CRRA200004917-1a_H57J7DSXY_L2_1.fq.gz wm_8ht2_R1.fq.gz
mv wm_8ht2_CRRA200004917-1a_H57J7DSXY_L2_2.fq.gz wm_8ht2_R2.fq.gz
mv wm_8ht3_CRRA200004925-2a_HT5WNDSXX_L1_1.fq.gz wm_8ht3_R1.fq.gz
mv wm_8ht3_CRRA200004925-2a_HT5WNDSXX_L1_2.fq.gz wm_8ht3_R2.fq.gz




























mv cf_2hc3_CRRA200004902-1a_H57J7DSXY_L2_1.fq.gz cf_2hc3_R1.fq.gz
mv cf_2hc3_CRRA200004902-1a_H57J7DSXY_L2_2.fq.gz cf_2hc3_R2.fq.gz
mv cf_2ht2_CRRA200004898-1a_H57J7DSXY_L2_1.fq.gz cf_2ht2_R1.fq.gz

mv cf_2ht2_CRRA200004898-1a_H57J7DSXY_L2_2.fq.gz cf_2ht2_R2.fq.gz


mv cf_8ht2_CRRA200004900-1a_H57J7DSXY_L2_1.fq.gz cf_8ht2_R1.fq.gz

mv cf_8ht2_CRRA200004900-1a_H57J7DSXY_L2_2.fq.gz cf_8ht2_R2.fq.gz

mv ne_16hc2_CRRA200004931-1a_HTL3WDSXX_L1_1.fq.gz ne_16hc2_R1.fq.gz



mv ne_16hc2_CRRA200004931-1a_HTL3WDSXX_L1_2.fq.gz ne_16hc2_R2.fq.gz

mv ne_16hc3_CRRA200004941-1a_HTL3WDSXX_L1_1.fq.gz ne_16hc3_R1.fq.gz

mv ne_16hc3_CRRA200004941-1a_HTL3WDSXX_L1_2.fq.gz ne_16hc3_R2.fq.gz

mv ne_16ht2_CRRA200004936-1a_HTL3WDSXX_L1_1.fq.gz ne_16ht2_R1.fq.gz

mv ne_16ht2_CRRA200004936-1a_HTL3WDSXX_L1_2.fq.gz ne_16ht2_R2.fq.gz

mv ne_16ht3_CRRA200004945-1a_HTL3WDSXX_L1_1.fq.gz ne_16ht3_R1.fq.gz

mv ne_16ht3_CRRA200004945-1a_HTL3WDSXX_L1_2.fq.gz ne_16ht3_R2.fq.gz

mv ne_2hc2_CRRA200004927-1a_HTL3WDSXX_L1_1.fq.gz ne_2hc2_R1.fq.gz

mv ne_2hc2_CRRA200004927-1a_HTL3WDSXX_L1_2.fq.gz ne_2hc2_R2.fq.gz

mv ne_2hc3_CRRA200004937-1a_HTL3WDSXX_L1_1.fq.gz ne_2hc3_R1.fq.gz

mv ne_2hc3_CRRA200004937-1a_HTL3WDSXX_L1_2.fq.gz ne_2hc3_R2.fq.gz

mv ne_2ht2_CRRA200004932-1a_HTL3WDSXX_L1_1.fq.gz ne_2ht2_R1.fq.gz

mv ne_2ht2_CRRA200004932-1a_HTL3WDSXX_L1_2.fq.gz ne_2ht2_R2.fq.gz

mv ne_2ht3_CRRA200004942-1a_HTL3WDSXX_L1_1.fq.gz ne_2ht3_R1.fq.gz

mv ne_2ht3_CRRA200004942-1a_HTL3WDSXX_L1_2.fq.gz ne_2ht3_R2.fq.gz

mv ne_4hc2a_CRRA200004928-1a_HTL3WDSXX_L1_1.fq.gz ne_4hc2_R1.fq.gz

mv ne_4hc2a_CRRA200004928-1a_HTL3WDSXX_L1_2.fq.gz ne_4hc2_R2.fq.gz

mv ne_4hc3_CRRA200004938-1a_HTL3WDSXX_L1_1.fq.gz ne_4hc3_R1.fq.gz

mv ne_4hc3_CRRA200004938-1a_HTL3WDSXX_L1_2.fq.gz ne_4hc3_R2.fq.gz
mv ne_4ht2b_CRRA200004934-1a_HTL3WDSXX_L1_1.fq.gz ne_4ht2_R1.fq.gz


mv ne_4ht2b_CRRA200004934-1a_HTL3WDSXX_L1_2.fq.gz ne_4ht2_R2.fq.gz
mv ne_4ht3_CRRA200004943-1a_HTL3WDSXX_L1_1.fq.gz ne_4ht3_R1.fq.gz
mv ne_4ht3_CRRA200004943-1a_HTL3WDSXX_L1_2.fq.gz ne_4ht3_R2.fq.gz
mv ne_8hc2_CRRA200004930-1a_HTL3WDSXX_L1_1.fq.gz ne_8hc2_R1.fq.gz
mv ne_8hc2_CRRA200004930-1a_HTL3WDSXX_L1_2.fq.gz ne_8hc2_R2.fq.gz
 
mv ne_8ht3_CRRA200004944-1a_HTL3WDSXX_L1_1.fq.gz ne_8ht3_R1.fq.gz
mv ne_8ht3_CRRA200004944-1a_HTL3WDSXX_L1_2.fq.gz ne_8ht3_R2.fq.gz
 
mv sk_16hc2_CRRA200004949-1a_HTL3WDSXX_L1_1.fq.gz sk_16hc2_R1.fq.gz
mv sk_16hc2_CRRA200004949-1a_HTL3WDSXX_L1_2.fq.gz sk_16hc2_R2.fq.gz
mv sk_16hc3_CRRA200004957-1a_HTL3WDSXX_L1_1.fq.gz sk_16hc3_R1.fq.gz
mv sk_16hc3_CRRA200004957-1a_HTL3WDSXX_L1_2.fq.gz sk_16hc3_R2.fq.gz
mv sk_16ht2_CRRA200004953-1a_HTL3WDSXX_L1_1.fq.gz sk_16ht2_R1.fq.gz
mv sk_16ht2_CRRA200004953-1a_HTL3WDSXX_L1_2.fq.gz sk_16ht2_R2.fq.gz
mv sk_16ht3_CRRA200004961-1a_HTL3WDSXX_L1_1.fq.gz sk_16ht3_R1.fq.gz
mv sk_16ht3_CRRA200004961-1a_HTL3WDSXX_L1_2.fq.gz sk_16ht3_R2.fq.gz
mv sk_2hc2_CRRA200004946-1a_HTL3WDSXX_L1_1.fq.gz sk_2hc2_R1.fq.gz
mv sk_2hc2_CRRA200004946-1a_HTL3WDSXX_L1_2.fq.gz sk_2hc2_R2.fq.gz
mv sk_2hc3_CRRA200004954-1a_HTL3WDSXX_L1_1.fq.gz sk_2hc3_R1.fq.gz
mv sk_2hc3_CRRA200004954-1a_HTL3WDSXX_L1_2.fq.gz sk_2hc3_R2.fq.gz
mv sk_2ht2_CRRA200004950-1a_HTL3WDSXX_L1_1.fq.gz sk_2ht2_R1.fq.gz
mv sk_2ht2_CRRA200004950-1a_HTL3WDSXX_L1_2.fq.gz sk_2ht2_R2.fq.gz
mv sk_2ht3_CRRA200004958-1a_HTL3WDSXX_L1_1.fq.gz sk_2ht3_R1.fq.gz
mv sk_2ht3_CRRA200004958-1a_HTL3WDSXX_L1_2.fq.gz sk_2ht3_R2.fq.gz
mv sk_4hc2_CRRA200004947-1a_HTL3WDSXX_L1_1.fq.gz sk_4hc2_R1.fq.gz
mv sk_4hc2_CRRA200004947-1a_HTL3WDSXX_L1_2.fq.gz sk_4hc2_R2.fq.gz
mv sk_4hc3_CRRA200004955-1a_HTL3WDSXX_L1_1.fq.gz sk_4hc3_R1.fq.gz
mv sk_4hc3_CRRA200004955-1a_HTL3WDSXX_L1_2.fq.gz sk_4hc3_R2.fq.gz
mv sk_4ht2_CRRA200004951-1a_HTL3WDSXX_L1_1.fq.gz sk_4ht2_R1.fq.gz
mv sk_4ht2_CRRA200004951-1a_HTL3WDSXX_L1_2.fq.gz sk_4ht2_R2.fq.gz
mv sk_8hc2_CRRA200004948-1a_HTL3WDSXX_L1_1.fq.gz sk_8hc2_R1.fq.gz
mv sk_8hc2_CRRA200004948-1a_HTL3WDSXX_L1_2.fq.gz sk_8hc2_R2.fq.gz
mv sk_8hc3_CRRA200004956-1a_HTL3WDSXX_L1_1.fq.gz sk_8hc3_R1.fq.gz
mv sk_8hc3_CRRA200004956-1a_HTL3WDSXX_L1_2.fq.gz sk_8hc3_R2.fq.gz
mv sk_8ht2_CRRA200004952-1a_HTL3WDSXX_L1_1.fq.gz sk_8ht2_R1.fq.gz
mv sk_8ht2_CRRA200004952-1a_HTL3WDSXX_L1_2.fq.gz sk_8ht2_R2.fq.gz
mv sk_8ht3_CRRA200004960-1a_HTL3WDSXX_L1_1.fq.gz sk_8ht3_R1.fq.gz
mv sk_8ht3_CRRA200004960-1a_HTL3WDSXX_L1_2.fq.gz sk_8ht3_R2.fq.gz
 
mv wm_16hc2_CRRA200004913-1a_H57J7DSXY_L2_1.fq.gz wm_16hc2_R1.fq.gz
mv wm_16hc2_CRRA200004913-1a_H57J7DSXY_L2_2.fq.gz wm_16hc2_R2.fq.gz
mv wm_16hc3_CRRA200004922-1a_HTL3WDSXX_L1_1.fq.gz wm_16hc3_R1.fq.gz
mv wm_16hc3_CRRA200004922-1a_HTL3WDSXX_L1_2.fq.gz wm_16hc3_R2.fq.gz
 
mv wm_16ht3_CRRA200004926-1a_HTL3WDSXX_L1_1.fq.gz wm_16ht3_R1.fq.gz
mv wm_16ht3_CRRA200004926-1a_HTL3WDSXX_L1_2.fq.gz wm_16ht3_R2.fq.gz
 
mv wm_2hc3_CRRA200004919-1a_H57J7DSXY_L2_1.fq.gz wm_2hc3_R1.fq.gz
mv wm_2hc3_CRRA200004919-1a_H57J7DSXY_L2_2.fq.gz wm_2hc3_R2.fq.gz
mv wm_2ht3_CRRA200004923-1a_HTL3WDSXX_L1_1.fq.gz wm_2ht3_R1.fq.gz
mv wm_2ht3_CRRA200004923-1a_HTL3WDSXX_L1_2.fq.gz wm_2ht3_R2.fq.gz
mv wm_4hc2_CRRA200004911-1a_H57J7DSXY_L2_1.fq.gz wm_4hc2_R1.fq.gz
mv wm_4hc2_CRRA200004911-1a_H57J7DSXY_L2_2.fq.gz wm_4hc2_R2.fq.gz
mv wm_4hc3_CRRA200004920-1a_HTL3WDSXX_L1_1.fq.gz wm_4hc3_R1.fq.gz
mv wm_4hc3_CRRA200004920-1a_HTL3WDSXX_L1_2.fq.gz wm_4hc3_R2.fq.gz
mv wm_4ht2_CRRA200004916-1a_H57J7DSXY_L2_1.fq.gz wm_4ht2_R1.fq.gz
mv wm_4ht2_CRRA200004916-1a_H57J7DSXY_L2_2.fq.gz wm_4ht2_R2.fq.gz
mv wm_4ht3_CRRA200004924-1a_HTL3WDSXX_L1_1.fq.gz wm_4ht3_R1.fq.gz
mv wm_4ht3_CRRA200004924-1a_HTL3WDSXX_L1_2.fq.gz wm_4ht3_R2.fq.gz
mv wm_8hc3_CRRA200004921-1a_HTL3WDSXX_L1_1.fq.gz wm_8hc3_R1.fq.gz
mv wm_8hc3_CRRA200004921-1a_HTL3WDSXX_L1_2.fq.gz wm_8hc3_R2.fq.gz
mv wm_8ht2_CRRA200004917-1a_H57J7DSXY_L2_1.fq.gz wm_8ht2_R1.fq.gz
mv wm_8ht2_CRRA200004917-1a_H57J7DSXY_L2_2.fq.gz wm_8ht2_R2.fq.gz
mv wm_8ht3_CRRA200004925-2a_HT5WNDSXX_L1_1.fq.gz wm_8ht3_R1.fq.gz
mv wm_8ht3_CRRA200004925-2a_HT5WNDSXX_L1_2.fq.gz wm_8ht3_R2.fq.gz

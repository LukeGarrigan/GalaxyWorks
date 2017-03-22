#!/bin/bash -e
#SBATCH -p tgac-medium
#SBATCH -c 4
#SBATCH -N 1
#SBATCH --mem 8000
#SBATCH -o /tgac/workarea/collaborators/traka/escape_pilot/slurm_Step11_Cuffquant_data_mem90GforTophat/cuffquant_T.%A_%a.out
#SBATCH -e /tgac/workarea/collaborators/traka/escape_pilot/slurm_Step11_Cuffquant_data_mem90GforTophat/cuffquant_T.%A_%a.err
#SBATCH --array=1-9
#SBATCH --mail-type=END,FAIL 
#SBATCH --mail-user=maria.traka@ifr.ac.uk

source cufflinks-2.2.1

datpath=/tgac/workarea/collaborators/traka/escape_pilot
mergepath=/tgac/workarea/collaborators/traka/escape_pilot/slurm_Step10_Cuffmerge_data_mem90GforTophat
genomepath=/tgac/workarea/collaborators/traka/Homo_sapiens.GRCh37.75.dna.toplevel.fa 


srun cuffquant -p 8 -u -o $datpath/slurm_Step11_Cuffquant_data_mem90GforTophat/TZ_${SLURM_ARRAY_TASK_ID} -b $genomepath $mergepath/merged.gtf $datpath/slurm_Step8_Tophat_data_mem90G/TZ_${SLURM_ARRAY_TASK_ID}/accepted_hits.bam

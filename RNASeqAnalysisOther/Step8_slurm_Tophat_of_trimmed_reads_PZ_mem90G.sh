#!/bin/bash -e
#SBATCH -p tgac-medium
#SBATCH -c 4
#SBATCH -N 1
#SBATCH --mem 90000
#SBATCH -o /tgac/workarea/collaborators/traka/escape_pilot/slurm_Step8_Tophat_data_mem90G/tophat.PZ.%A_%a.out
#SBATCH -e /tgac/workarea/collaborators/traka/escape_pilot/slurm_Step8_Tophat_data_mem90G/tophat.PZ.%A_%a.err
#SBATCH --array=1-9
#SBATCH --mail-type=END,FAIL 
#SBATCH --mail-user=maria.traka@ifr.ac.uk

source tophat-2.1.0
source bowtie-2.2.6

datpath=/tgac/workarea/collaborators/traka
genome=igenomes_Homo_sapiens_Ensembl_GRCh37/Ensembl/GRCh37/Sequence/Bowtie2Index/genome #this is the <genome_index_base>.The basename is the name of any of the index files up to but not including the first period. 

srun tophat -p 4 --min-anchor-length 12 --max-multihits 20 -o $datpath/escape_pilot/slurm_Step8_Tophat_data_mem90G/PZ_${SLURM_ARRAY_TASK_ID} $datpath/$genome $datpath/escape_pilot/TrimGalore_data_and_fastQC/PZ_${SLURM_ARRAY_TASK_ID}.nonrRNA.unmerged1_val_1.fq $datpath/escape_pilot/TrimGalore_data_and_fastQC/PZ_${SLURM_ARRAY_TASK_ID}.nonrRNA.unmerged2_val_2.fq

###all the samples (PZ and TZ) run successfully apart from TZ_7, which needed 100G memory.
###I am running the TZ_7 on its own requesting 90G to find out if it was just a fluke, while running the TZ[1-9] array. OUTCOME: when run on its own then it worked with the 90G memory request. No error message at the bottom of the .err file BUT the .bam files of the 90G run and 100G run are different as determined with the 'diff' command.
####TZ_7 run as part of all the 9 job array >>job ID 524860
####TZ_7 run with 90G mem request >> job ID 535387
####TZ_7 run with 100G mem request >> job ID 535388
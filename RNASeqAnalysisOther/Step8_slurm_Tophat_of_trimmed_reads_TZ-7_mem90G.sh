#!/bin/bash -e
#SBATCH -p tgac-medium
#SBATCH -c 4
#SBATCH -N 1
#SBATCH --mem 100000
#SBATCH -o /tgac/workarea/collaborators/traka/escape_pilot/slurm_Step8_Tophat_data_mem90G/tophat.TZ.%A_%a.out
#SBATCH -e /tgac/workarea/collaborators/traka/escape_pilot/slurm_Step8_Tophat_data_mem90G/tophat.TZ.%A_%a.err
#SBATCH --array=7
#SBATCH --mail-type=END,FAIL 
#SBATCH --mail-user=maria.traka@ifr.ac.uk

source tophat-2.1.0
source bowtie-2.2.6

datpath=/tgac/workarea/collaborators/traka
genome=igenomes_Homo_sapiens_Ensembl_GRCh37/Ensembl/GRCh37/Sequence/Bowtie2Index/genome #this is the <genome_index_base>.The basename is the name of any of the index files up to but not including the first period. 

srun tophat -p 4 --min-anchor-length 12 --max-multihits 20 -o $datpath/escape_pilot/slurm_Step8_Tophat_data_mem90G/TZ_${SLURM_ARRAY_TASK_ID}_10G $datpath/$genome $datpath/escape_pilot/TrimGalore_data_and_fastQC/TZ_${SLURM_ARRAY_TASK_ID}.nonrRNA.unmerged1_val_1.fq $datpath/escape_pilot/TrimGalore_data_and_fastQC/TZ_${SLURM_ARRAY_TASK_ID}.nonrRNA.unmerged2_val_2.fq

#100G is significantly faster than 90G. Test: same sample (TZ-7) run on 90G and 100G at the same time.
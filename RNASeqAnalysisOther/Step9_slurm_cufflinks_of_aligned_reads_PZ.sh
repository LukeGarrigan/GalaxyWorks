#!/bin/bash -e
#SBATCH -p tgac-medium
#SBATCH -c 8
#SBATCH -N 1
#SBATCH --mem 16000
#SBATCH -o /tgac/workarea/collaborators/traka/escape_pilot/slurm_Step9_Cufflinks_data_mem90GforTophat/cufflinks.PZ.%A_%a.out
#SBATCH -e /tgac/workarea/collaborators/traka/escape_pilot/slurm_Step9_Cufflinks_data_mem90GforTophat/cufflinks.PZ.%A_%a.err
#SBATCH --array=1-9
#SBATCH --mail-type=END,FAIL 
#SBATCH --mail-user=maria.traka@ifr.ac.uk

source cufflinks-2.2.1

datpath=/tgac/workarea/collaborators/traka/escape_pilot
gtfpath=/tgac/workarea/collaborators/traka/igenomes_Homo_sapiens_Ensembl_GRCh37/Ensembl/GRCh37/Annotation/Archives/archive-2015-07-17-14-31-42/Genes/genes.gtf


srun cufflinks -p 8 -G $gtfpath -u -o $datpath/slurm_Step9_Cufflinks_data_mem90GforTophat/PZ_${SLURM_ARRAY_TASK_ID} $datpath/slurm_Step8_Tophat_data_mem90G/PZ_${SLURM_ARRAY_TASK_ID}/accepted_hits.bam

#!/bin/bash -e
#SBATCH -p tgac-medium
#SBATCH -c 2
#SBATCH -N 1
#SBATCH --mem 100000
#SBATCH -o /tgac/workarea/collaborators/traka/escape_pilot/slurm_Step10_Cuffmerge_data_mem90GforTophat/cuffmerge.out
#SBATCH -e /tgac/workarea/collaborators/traka/escape_pilot/slurm_Step10_Cuffmerge_data_mem90GforTophat/cuffmerge.err
#SBATCH --mail-type=END,FAIL 
#SBATCH --mail-user=maria.traka@ifr.ac.uk

source cufflinks-2.2.1

datpath=/tgac/workarea/collaborators/traka/escape_pilot
genomepath=/tgac/workarea/collaborators/traka/Homo_sapiens.GRCh37.75.dna.toplevel.fa 
gtfpath=/tgac/workarea/collaborators/traka/igenomes_Homo_sapiens_Ensembl_GRCh37/Ensembl/GRCh37/Annotation/Archives/archive-2015-07-17-14-31-42/Genes/genes.gtf

srun cuffmerge -o $datpath/slurm_Step10_Cuffmerge_data_mem90GforTophat -g $gtfpath -p 2 -s $genomepath $datpath/slurm_Step10_Cuffmerge_data_mem90GforTophat/assembly_list.txt

#29Feb2016:mem 10000 or 16000 is not enough as i got cuffmerge.err: "slurmstepd: Exceeded job memory limit at some point. Job may have been partially swapped out to disk."
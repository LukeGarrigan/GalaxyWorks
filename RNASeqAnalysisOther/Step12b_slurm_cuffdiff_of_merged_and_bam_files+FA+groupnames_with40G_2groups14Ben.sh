#!/bin/bash -e
#SBATCH -p tgac-medium
#SBATCH -c 8
#SBATCH -N 1
#SBATCH --mem 40000
#SBATCH -o /tgac/workarea/collaborators/traka/escape_pilot/slurm_Step12b_Cuffdiff_data_mem90GforTophat+FA+groupnames+bamInput_2groups14Ben_with40G/slurm_cuffdiff.out
#SBATCH -e /tgac/workarea/collaborators/traka/escape_pilot/slurm_Step12b_Cuffdiff_data_mem90GforTophat+FA+groupnames+bamInput_2groups14Ben_with40G/slurm_cuffdiff.err
#SBATCH --mail-type=END,FAIL 
#SBATCH --mail-user=maria.traka@ifr.ac.uk

source cufflinks-2.2.1

datpath=/tgac/workarea/collaborators/traka/escape_pilot
mergepath=/tgac/workarea/collaborators/traka/escape_pilot/slurm_Step10_Cuffmerge_data_mem90GforTophat
abundpath=/tgac/workarea/collaborators/traka/escape_pilot/slurm_Step8_Tophat_data_mem90G
#gtfpath=/tgac/workarea/collaborators/traka/igenomes_Homo_sapiens_Ensembl_GRCh37/Ensembl/GRCh37/Annotation/Archives/archive-2015-07-17-14-31-42/Genes/genes.gtf
genomepath=/tgac/workarea/collaborators/traka/Homo_sapiens.GRCh37.75.dna.toplevel.fa 



srun cuffdiff -o $datpath/slurm_Step12b_Cuffdiff_data_mem90GforTophat+FA+groupnames+bamInput_2groups14Ben_with40G -b $genomepath -p 8 -L PZ,TZ -u $mergepath/merged.gtf  $abundpath/PZ_1/accepted_hits.bam,$abundpath/PZ_3/accepted_hits.bam,$abundpath/PZ_4/accepted_hits.bam,$abundpath/PZ_5/accepted_hits.bam,$abundpath/PZ_6/accepted_hits.bam,$abundpath/PZ_8/accepted_hits.bam,$abundpath/PZ_9/accepted_hits.bam $abundpath/TZ_2/accepted_hits.bam,$abundpath/TZ_4/accepted_hits.bam,$abundpath/TZ_5/accepted_hits.bam,$abundpath/TZ_6/accepted_hits.bam,$abundpath/TZ_7/accepted_hits.bam,$abundpath/TZ_8/accepted_hits.bam,$abundpath/TZ_9/accepted_hits.bam 


#I am running with -b [genome.fa] option
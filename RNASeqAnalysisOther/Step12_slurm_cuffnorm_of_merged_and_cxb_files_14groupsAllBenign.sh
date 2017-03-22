#!/bin/bash -e
#SBATCH -p tgac-medium
#SBATCH -c 2
#SBATCH -N 1
#SBATCH --mem 20000
#SBATCH -o /tgac/workarea/collaborators/traka/escape_pilot/slurm_Step12_Cuffnorm_data_mem90GforTophat_14groupsAllBenign/slurm_cuffnorm.out
#SBATCH -e /tgac/workarea/collaborators/traka/escape_pilot/slurm_Step12_Cuffnorm_data_mem90GforTophat_14groupsAllBenign/slurm_cuffnorm.err
#SBATCH --mail-type=END,FAIL 
#SBATCH --mail-user=maria.traka@ifr.ac.uk

source cufflinks-2.2.1

datpath=/tgac/workarea/collaborators/traka/escape_pilot
mergepath=/tgac/workarea/collaborators/traka/escape_pilot/slurm_Step10_Cuffmerge_data_mem90GforTophat
abundpath=/tgac/workarea/collaborators/traka/escape_pilot/slurm_Step11_Cuffquant_data_mem90GforTophat


srun cuffnorm -o $datpath/slurm_Step12_Cuffnorm_data_mem90GforTophat_14groupsAllBenign -p 4 $mergepath/merged.gtf $abundpath/PZ_1/abundances.cxb $abundpath/PZ_3/abundances.cxb $abundpath/PZ_4/abundances.cxb $abundpath/PZ_5/abundances.cxb $abundpath/PZ_6/abundances.cxb $abundpath/PZ_8/abundances.cxb $abundpath/PZ_9/abundances.cxb $abundpath/TZ_2/abundances.cxb $abundpath/TZ_4/abundances.cxb $abundpath/TZ_5/abundances.cxb $abundpath/TZ_6/abundances.cxb $abundpath/TZ_7/abundances.cxb $abundpath/TZ_8/abundances.cxb $abundpath/TZ_9/abundances.cxb

#–By default, Cuffnorm reports expression levels in the “simple-table” tab-delimted text files. The program also reports information about your samples and about the genes, transcripts, TSS groups, and CDS groups as tab delimited text files. Note that these files have a different format than the files used by Cuffdiff. However, you can direct Cuffnorm to report its output in the same format as used by Cuffdiff if you wish. Simply supply the option –output-format cuffdiff at the command line.


   
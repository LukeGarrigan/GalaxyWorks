###############################################################
#Step 8 - Tophat alignment of trimmed reads####################
###############################################################
# bowtie2 files (.bt2) were downloaded from igenomes
#with slurm it is better to run PZ and TZ as separate jobs (submit two scripts below) so that they run in parallel and don't waste time

sbatch Step8_slurm_Tophat_of_trimmed_reads_PZ_mem90G.sh
sbatch Step8_slurm_Tophat_of_trimmed_reads_TZ_mem90G.sh
###all the samples (PZ and TZ) run successfully apart from TZ_7, which needed more memory.
###I am running the TZ_7 on its own requesting 90G to find out if it was just a fluke, while running the TZ[1-9] array. OUTCOME: when run on its own then it worked with the 90G memory request. No error message at the bottom of the .err file BUT the .bam files of the 90G run and 100G run are different as determined with the 'diff' command.
####TZ_7 run as part of all the 9 job array >>job ID 524860
####TZ_7 run with 90G mem request >> job ID 535387
####TZ_7 run with 100G mem request >> job ID 535388
sbatch Step8_slurm_Tophat_of_trimmed_reads_TZ-7_mem90G.sh


###############################################################
#Step 9 - Cufflinks of aligned reads###########################
###############################################################
#.gtf file downloaded from igenomes (Ensembl GRCh37)
#gtfpath=/tgac/workarea/collaborators/traka/igenomes_Homo_sapiens_Ensembl_GRCh37/Ensembl/GRCh37/Annotation/Archives/archive-2015-07-17-14-31-42/Genes/genes.gtf


sbatch Step9_slurm_cufflinks_of_aligned_reads_PZ.sh
sbatch Step9_slurm_cufflinks_of_aligned_reads_TZ.sh

###############################################################
#Step 10 - Cuffmerge of cufflinks assembly GTF files###########
###############################################################
#used the \\tgac-group-data\tgac_hpc_work\collaborators\traka\igenomes_Homo_sapiens_Ensembl_GRCh37  for the .gtf and Bowtie2 files but used the fasta genome file downloaded directly from Ensembl  /tgac/workarea/collaborators/traka/Homo_sapiens.GRCh37.75.dna.toplevel.fa 

sbatch Step10_slurm_cuffmerge.sh 

###############################################################
#Step 11 - Cuffquant of cuffmerge assembly GTF files###########
###############################################################
#Cuffquant allows you to compute the gene and transcript expression profiles and save these profiles to files that you can analyze later with Cuffdiff or Cuffnorm. 
#Cuffquant takes as input a single SAM/BAM file of aligned reads and a single GTF/GFF file of gene annotations.

sbatch Step11_slurm_cuffquant_of_merged_and_bam_files_PZ.sh
sbatch Step11_slurm_cuffquant_of_merged_and_bam_files_TZ.sh

###############################################################
#Step 12 - Cuffnorm of cuffmerge assembly GTF files###########
###############################################################

#Sometimes, all you want to do is normalize the expression levels from a set of RNA-Seq libraries so that they’re all on the same scale, facilitating downstream analyses such as clustering. Expression levels reported by Cufflinks in FPKM units are usually comparable between samples, but in certain situations, applying an extra level of normalization can remove sources of bias in the data. Cuffnorm normalizes a set of samples to be on as similar scales as possible, which can improve the results you obtain with other downstream tools.

sbatch Step12_slurm_cuffnorm_of_merged_and_cxb_files.sh

#the following is providing cuffdiff output format BUT has not worked
sbatch Step12_slurm_cuffnorm_of_merged_and_cxb_files_Cuffdiff_Output.sh
#error message:
#srun: error: t256n13: task 0: Exited with exit code 1
#Error: number of labels must match number of conditions

#the following is normalising without calling groups (it is including only the 14 benign samples)
sbatch Step12_slurm_cuffnorm_of_merged_and_cxb_files_14groupsAllBenign.sh

#the following is normalising without calling groups (it is including all 18 samples)
sbatch Step12_slurm_cuffnorm_of_merged_and_cxb_files_18groupsBen+Can.sh

###############################################################
#Step 12b - Cuffdiff of cuffmerge and cxb files###########
###############################################################
###Using the cxb files it does not work!##################
sbatch Step12b_slurm_cuffdiff_of_merged_and_cxb_files_with40G.sh

#run the same but the option to provide a .fa file
sbatch Step12b_slurm_cuffdiff_of_merged_and_cxb_files+FA_with40G.sh
#this ran fine and all the file outputs look right but in the *.err file there is the message:
#slurmstepd: Exceeded job memory limit at some point. Job may have been partially swapped out to disk.

#run with .fa and group labels. 
sbatch Step12b_slurm_cuffdiff_of_merged_and_cxb_files+FA+groupnames_with40G_2groups14Ben.sh

#run with .fa, group labels and bam files from Tophat instead of cxb files 
sbatch Step12b_slurm_cuffdiff_of_merged_and_bam_files+FA+groupnames_with40G_2groups14Ben.sh
#################################################################################
###Using the cxb files it does not work!So I will use the bam files##################
#################################################################################
###############################################################
#Step 12b - Cuffdiff of cuffmerge and bam files###########
###############################################################
sbatch Step12b_slurm_cuffdiff_of_merged_and_bam_files+FA+groupnames_with40G_2groups14Ben.sh


squeue -u traka
source fastqc-0.11.3
source sortmerna-1.9
source trim_galore-0.3.7

###################################################
#Step 1 - run fastQC for all the raw data files####
###################################################
source fastqc-0.11.3
find /tgac/workarea/collaborators/traka/escape_pilot/raw_data *_R*.fastq.gz | grep -i gz$ | sort -n | xargs -i{} -n1  bsub -qTest128 fastqc {} --outdir=/tgac/workarea/collaborators/traka/escape_pilot/Step1_fastQC_reports
#some times it does not like the -o option of the bsub...

###################################################
#Step 2 - concatenate all the raw data files#######
###################################################
bsub < Step2_concatenate_of-rawdata.sh

###########################################################
#Step 3 - gunzip all the concatenated raw data files#######
###########################################################
find /tgac/workarea/collaborators/traka/escape_pilot/raw_data_concatenated/*.gz |  xargs -i{} -n1 bsub -qTest128 gunzip {}

##################################################
#Step 4 - merge the R1 and R2 reads###############
##################################################
source sortmerna-1.9
bsub < Step4_merge_concatenated_rawdata.sh

##################################################
#Step 5 - run sortmerna on the merged reads#######
##################################################
source sortmerna-1.9
bsub < Step5_sortmerna.sh

##################################################
#Step 6 - unmerge the non-rRNA reads##############
##################################################
source sortmerna-1.9
bsub < Step6_unmerge_nonRNAdata.sh

###############################################################
#Step 7 - Trim_Galore the unmerged non-rRNA reads##############
###############################################################
source trim_galore-0.3.7
source fastqc-0.11.3
bsub < Step7_TrimGalore_and_fastQC_of_unmerged_nonrRNAreads.sh


###############################################################
###############################################################
###############################################################
#####I did not finish optimising the following steps in lsf####
#####So I had to move to slurm#################################
#####See file 'Steps8-12_slurm_RNAseq.sh' for remaining steps##
###############################################################
###############################################################
###############################################################
###############################################################
###############################################################
###############################################################
###############################################################
###############################################################
###############################################################
###############################################################
###############################################################



###############################################################
#Step 8 - Tophat alignment of trimmed reads####################
###############################################################
#download annotation from TopHat website and then make sure the 'genome.fa file' is within the 'Bowtie2Index' folder

source tophat-2.1.0
source bowtie-2.2.6
bsub < Step8_Tophat_of_trimmed_reads_Jan2016.sh
#second try with the top.dna files:
bsub < Step8_Tophat_of_trimmed_reads_21Jan2016.sh
#15Feb: run the Tophat pipeline with the \\tgac-group-data\tgac_hpc_work\collaborators\traka\igenomes_Homo_sapiens_Ensembl_GRCh37
bsub < Step8_Tophat_of_trimmed_reads_15Feb_only2samples.sh

###############################################################
#Step 9 - Cufflinks of aligned reads###########################
###############################################################
#download .gtf file from TopHat website (done in the previous step_

bsub < Step9_cufflinks_of_aligned_reads.sh
#NOTE: cufflinks -G instead of -g (-g does not work)
#22Jan: run cufflinks with the new .gtf from http://www.ensembl.org/info/data/ftp/index.html
bsub < Step9_cufflinks_of_aligned_reads_22Jan.sh
#15Feb: run the Tophat pipeline with the \\tgac-group-data\tgac_hpc_work\collaborators\traka\igenomes_Homo_sapiens_Ensembl_GRCh37
bsub < Step9_cufflinks_of_aligned_reads_15Feb_only2samples.sh

###############################################################
#Step 10 - Cuffmerge of cufflinks assembly GTF files###########
###############################################################
source cufflinks-2.2.1
#First Create “manifest” file listing full paths to the input files 'assembly_list.txt'

datpath=/tgac/workarea/collaborators/traka/escape_pilot
gtfpath=/tgac/workarea/collaborators/traka/escape_pilot/annotation_GRCh37/genes.gtf

bsub -q Test128 -R "rusage[mem=10000]" -n 2 "cuffmerge -o Cuffmerge -g $gtfpath -p 2 -s $datpath/annotation_GRCh37/Bowtie2Index/genome.fa $datpath/Cuffmerge/assembly_list.txt"

#it didn't work with the genome.fa so i'll try with another .fa file (Friday 15/1/16):
bsub -q Test128 -R "rusage[mem=10000]" -n 2 "cuffmerge -o Cuffmerge2 -g $gtfpath -p 2 -s $datpath/annotation_GRCh37/Homo_sapiens.GRCh37.75.dna.toplevel.fa $datpath/Cuffmerge2/assembly_list.txt"

#15Feb: run the Tophat pipeline with the \\tgac-group-data\tgac_hpc_work\collaborators\traka\igenomes_Homo_sapiens_Ensembl_GRCh37
datpath=/tgac/workarea/collaborators/traka/escape_pilot
genomepath=/tgac/workarea/collaborators/traka/igenomes_Homo_sapiens_Ensembl_GRCh37/Ensembl/GRCh37/Sequence/WholeGenomeFasta/genome.fa
gtfpath=/tgac/workarea/collaborators/traka/igenomes_Homo_sapiens_Ensembl_GRCh37/Ensembl/GRCh37/Annotation/Archives/archive-2015-07-17-14-31-42/Genes/genes.gtf
bsub -q Test128 -R "rusage[mem=10000]" -n 2 "cuffmerge -o Cuffmerge_15Feb -g $gtfpath -p 2 -s $genomepath $datpath/Cuffmerge_15Feb/assembly_list.txt"

#15Feb_Take 2: run the Tophat pipeline with the \\tgac-group-data\tgac_hpc_work\collaborators\traka\igenomes_Homo_sapiens_Ensembl_GRCh37
datpath=/tgac/workarea/collaborators/traka/escape_pilot
genomepath=/tgac/workarea/collaborators/traka/igenomes_Homo_sapiens_Ensembl_GRCh37/Ensembl/GRCh37/Sequence/Chromosomes
gtfpath=/tgac/workarea/collaborators/traka/igenomes_Homo_sapiens_Ensembl_GRCh37/Ensembl/GRCh37/Annotation/Archives/archive-2015-07-17-14-31-42/Genes/genes.gtf
bsub -q Test128 -R "rusage[mem=10000]" -n 2 "cuffmerge -o Cuffmerge_15Feb -g $gtfpath -p 2 -s $genomepath $datpath/Cuffmerge_15Feb/assembly_list.txt"

#15Feb_Take 3: run the Tophat pipeline with the \\tgac-group-data\tgac_hpc_work\collaborators\traka\igenomes_Homo_sapiens_Ensembl_GRCh37  for the .gtf and Bowtie2 files but use the fasta genome file downloaded directly from Ensembl
datpath=/tgac/workarea/collaborators/traka/escape_pilot
genomepath=/tgac/workarea/collaborators/traka/Homo_sapiens.GRCh37.75.dna.toplevel.fa 
#i used grep to check if the .fa file had the entry that is missing from the above .fa files. I did:
#grep "GL000191.1" Homo_sapiens.GRCh37.75.dna.toplevel.fa #this returned an entry.
gtfpath=/tgac/workarea/collaborators/traka/igenomes_Homo_sapiens_Ensembl_GRCh37/Ensembl/GRCh37/Annotation/Archives/archive-2015-07-17-14-31-42/Genes/genes.gtf
bsub -q Test128 -R "rusage[mem=10000]" -n 2 "cuffmerge -o $datpath/Cuffmerge_15Feb -g $gtfpath -p 2 -s $genomepath $datpath/Cuffmerge_15Feb/assembly_list.txt"


###############################################################
#Step 11 - Cuffquant of cuffmerge assembly GTF files###########
###############################################################
#Cuffquant allows you to compute the gene and transcript expression profiles and save these profiles to files that you can analyze later with Cuffdiff or Cuffnorm. 

#Cuffquant takes as input a single SAM/BAM file of aligned reads and a single GTF/GFF file of gene annotations.

#I used the merged.gtf file that Purnima generated for my samples
bsub < Step11_cuffquant_of_merged_and_bam_files_15Feb.sh

###############################################################
#Step 12 - Cuffnorm of cuffmerge assembly GTF files###########
###############################################################

#Sometimes, all you want to do is normalize the expression levels from a set of RNA-Seq libraries so that they’re all on the same scale, facilitating downstream analyses such as clustering. Expression levels reported by Cufflinks in FPKM units are usually comparable between samples, but in certain situations, applying an extra level of normalization can remove sources of bias in the data. Cuffnorm normalizes a set of samples to be on as similar scales as possible, which can improve the results you obtain with other downstream tools.

source cufflinks-2.2.1
datpath=/tgac/workarea/collaborators/traka/escape_pilot
mergepath=/tgac/workarea/collaborators/traka/Cuffmerge_15Feb

bsub -q Test128 -R "rusage[mem=10000]" -n 2 "cuffnorm -o $datpath/Cuffnorm_15Feb -L PeZ,TrZ -p 4 $mergepath/merged.gtf $datpath/Cuffquant_data_15Feb/PZ_1/abundances.cxb $datpath/Cuffquant_data_15Feb/TZ_1/abundances.cxb"

#!/bin/bash
#BSUB -q Test128
#BSUB -n 1
#BSUB -J sortme[1-9]

source sortmerna-1.9
datpath=/tgac/workarea/collaborators/traka/escape_pilot/
dbstr=/tgac/software/testing/sortmerna/1.9/x86_64/sortmerna/rRNA_databases/

#folder that contains rRNA databases:
#/tgac/software/testing/sortmerna/1.9/x86_64/sortmerna/rRNA_databases/
#these are the rRNA databases:
#rfam-5.8s-database-id98.fasta
#rfam-5s-database-id98.fasta
#silva-arc-16s-database-id95.fasta
#silva-arc-23s-database-id98.fasta
#silva-bac-16s-database-id85.fasta
#silva-bac-23s-database-id98.fasta
#silva-euk-18s-database-id95.fasta
#silva-euk-28s-database-id98.fasta


sortmerna -n 8 --db $dbstr/rfam-5.8s-database-id98.fasta $dbstr/rfam-5s-database-id98.fasta $dbstr/silva-arc-16s-database-id95.fasta $dbstr/silva-arc-23s-database-id98.fasta $dbstr/silva-bac-16s-database-id85.fasta $dbstr/silva-bac-23s-database-id98.fasta $dbstr/silva-euk-18s-database-id95.fasta $dbstr/silva-euk-28s-database-id98.fasta --I $datpath/raw_data_concatenated/PZ_${LSB_JOBINDEX}_mergedfile.fastq --accept $datpath/raw_data_concatenated/PZ_${LSB_JOBINDEX}.rRNA --other $datpath/raw_data_concatenated/PZ_${LSB_JOBINDEX}.nonrRNA --paired-out --bydbs --log $datpath/raw_data_concatenated/PZ_${LSB_JOBINDEX}.log -a 4 

sortmerna -n 8 --db $dbstr/rfam-5.8s-database-id98.fasta $dbstr/rfam-5s-database-id98.fasta $dbstr/silva-arc-16s-database-id95.fasta $dbstr/silva-arc-23s-database-id98.fasta $dbstr/silva-bac-16s-database-id85.fasta $dbstr/silva-bac-23s-database-id98.fasta $dbstr/silva-euk-18s-database-id95.fasta $dbstr/silva-euk-28s-database-id98.fasta --I $datpath/raw_data_concatenated/TZ_${LSB_JOBINDEX}_mergedfile.fastq --accept $datpath/raw_data_concatenated/TZ_${LSB_JOBINDEX}.rRNA --other $datpath/raw_data_concatenated/TZ_${LSB_JOBINDEX}.nonrRNA --paired-out --bydbs --log $datpath/raw_data_concatenated/TZ_${LSB_JOBINDEX}.log -a 4 



#Purnima allocated the following resources in her script:
#BSUB -n 4
#BSUB -R "span[ptile=4]rusage[mem=20000]"
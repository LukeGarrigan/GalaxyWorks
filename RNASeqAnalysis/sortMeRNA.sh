#!/bin/bash -e 

#SBATCH -p tgac-short
#SBATCH -o slurm.%N.%j.out # STDOUT
#SBATCH -e slurm.%N.%j.err # STDERRi
#SBATCH -n 1


source sortmerna-1.9
dbstr=/tgac/software/testing/sortmerna/1.9/x86_64/sortmerna/rRNA_databases

#sortmerna -n 8 --db $dbstr/rfam-5.8s-database-id98.fasta $dbstr/rfam-5s-database-id98.fasta $dbstr/silva-arc-16s-database-id95.fasta $dbstr/silva-arc-23s-database-id98.fasta $dbstr/silva-bac-16s-database-id85.fasta $dbstr/silva-bac-23s-database-id98.fasta $dbstr/silva-euk-18s-database-id95.fasta $dbstr/silva-euk-28s-database-id98.fasta --I $1 --accept $1.rRNA --other $1.nonrRNA --paired-out --bydbs --log $1.log -a 4 


sortmerna -n 8 --db $dbstr/rfam-5.8s-database-id98.fasta $dbstr/rfam-5s-database-id98.fasta $dbstr/silva-arc-16s-database-id95.fasta $dbstr/silva-arc-23s-database-id98.fasta $dbstr/silva-bac-16s-database-id85.fasta $dbstr/silva-bac-23s-database-id98.fasta $dbstr/silva-euk-18s-database-id95.fasta $dbstr/silva-euk-28s-database-id98.fasta --I $1 --accept $1.rRNA --other $1.nonrRNA --paired-out --bydbs --log $1.log -a 4



# PERLA'S CODE

#sortmerna -n 8 --db $dbstr/rfam-5.8s-database-id98.fasta $dbstr/rfam-5s-database-id98.fasta $dbstr/silva-arc-16s-database-id95.fasta $dbstr/silva-arc-23s-database-id98.fasta $dbstr/silva-bac-16s-database-id85.fasta $dbstr/silva-bac-23s-database-id98.fasta $dbstr/silva-euk-18s-database-id95.fasta $dbstr/silva-euk-28s-database-id98.fasta --I $datpath/SortMeRNA/merged/$nameFile${LSB_JOBINDEX}_mergedfile.fastq --accept $datpath/SortMeRNA/$nameFile${LSB_JOBINDEX}.rRNA --other $datpath/SortMeRNA/$nameFile${LSB_JOBINDEX}.nonrRNA --paired-out --bydbs --log $datpath/SortMeRNA/$nameFile${LSB_JOBINDEX}.log -a 4


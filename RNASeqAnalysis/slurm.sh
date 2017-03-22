#!/bin/bash -e 

#SBATCH -p tgac-short
#SBATCH -o slurm.%N.%j.out # STDOUT
#SBATCH -e slurm.%N.%j.err # STDERRi
#SBATCH -n 1

# **************VERY IMPORTANT NOTE*****************************
# This script is to be ran one step at a time to ensure there 
# are no issues with the data




##################################################################
################# Step 1 - Unzip the data ########################
##################################################################
#find $dataPath/ -name '*.gz' |  xargs -i{} -n1 sbatch -ptgac-short unzipData.sh {}
dataPath=RawData/zipped

##################################################################
############## Step 2 - merge the raw data #######################
##################################################################
#mkdir -p sortRNA/merged
#find $dataPath/ -name '*_1.fastq.gz' |  xargs -i{} -n1 sbatch -ptgac-short mergeData.sh {}



#################################################################
############# Step 3 - Sort the reads ###########################
#################################################################
#find sortRNA/merged/ -type f -name '*merged.fastq' | xargs -I{} -n1 sbatch -ptgac-medium sortMeRNA.sh {}




################################################################
########## Step 4 - unmerging the reads ########################
################################################################
#mkdir -p sortRNA/unmerged
#find ./sortRNA/merged -type f -name "*non*" | xargs -I{}  basename {} | cut -d . -f 1 | xargs -i{} -n1 sbatch -ptgac-short unmergeRNA.sh {} 

################################################################
######## Step 5 - Trim Galore ##################################
################################################################
#mkdir -p trimGaloreData
#find ./sortRNA/unmerged/ -type f | xargs -I{} basename {} | cut -d . -f 1 | xargs -i{} -n1 sbatch -ptgac-medium trimGalore.sh {}

################################################################
######### Step 6 - Top Hat and Bow tie #########################
################################################################

#######################################
### Bowtie2 indexes for genome reference
#######################################
#Create Bowtie2 indexes for the genome reference
#$ interactive
#$ cd  /tgac/wrkarea/collaborators/hallli/EPS_JK2014/RNASeqProcessingData/ReferenceAndAnnotation/
#$ source bowtie-2.2.5
#$ bowtie2-build bifidobacteria_copy.fna


#mkdir -p topHatData
# needs changing
find ./trimGaloreData/ -maxdepth 1 -name "*.fq" | xargs -I{} basename {} | cut -d . -f 1 | sort -u | xargs -I{} -n1 sbatch -ptgac-medium topHat1.sh {}





























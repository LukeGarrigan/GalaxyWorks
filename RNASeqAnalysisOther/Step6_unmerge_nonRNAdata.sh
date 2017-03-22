#!/bin/bash
#BSUB -q Test128
#BSUB -n 4
#BSUB -R "span[ptile=4]rusage[mem=10000]"
#BSUB -J unmerge[1-9]

datpath=/tgac/workarea/collaborators/traka/escape_pilot/

/tgac/software/testing/sortmerna/1.9/src/sortmerna-1.9/scripts/unmerge-paired-reads.sh $datpath/raw_data_concatenated/PZ_${LSB_JOBINDEX}.nonrRNA.fastq $datpath/raw_data_concatenated/PZ_${LSB_JOBINDEX}.nonrRNA.unmerged1.fastq $datpath/raw_data_concatenated/PZ_${LSB_JOBINDEX}.nonrRNA.unmerged2.fastq 

/tgac/software/testing/sortmerna/1.9/src/sortmerna-1.9/scripts/unmerge-paired-reads.sh $datpath/raw_data_concatenated/TZ_${LSB_JOBINDEX}.nonrRNA.fastq $datpath/raw_data_concatenated/TZ_${LSB_JOBINDEX}.nonrRNA.unmerged1.fastq $datpath/raw_data_concatenated/TZ_${LSB_JOBINDEX}.nonrRNA.unmerged2.fastq 


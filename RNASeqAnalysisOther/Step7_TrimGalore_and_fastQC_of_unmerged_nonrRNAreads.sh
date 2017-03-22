#!/bin/bash
#BSUB -q Test128
#BSUB -n 4
#BSUB -R "span[ptile=4]rusage[mem=10000]"
#BSUB -J trimg[1-9]

datpath=/tgac/workarea/collaborators/traka/escape_pilot/

trim_galore -q 20 --phred33 --stringency 5 -length 60 --paired -o $datpath/TrimGalore_data_and_fastQC --fastqc $datpath/raw_data_concatenated/PZ_${LSB_JOBINDEX}.nonrRNA.unmerged1.fastq $datpath/raw_data_concatenated/PZ_${LSB_JOBINDEX}.nonrRNA.unmerged2.fastq

trim_galore -q 20 --phred33 --stringency 5 -length 60 --paired -o $datpath/TrimGalore_data_and_fastQC --fastqc $datpath/raw_data_concatenated/TZ_${LSB_JOBINDEX}.nonrRNA.unmerged1.fastq $datpath/raw_data_concatenated/TZ_${LSB_JOBINDEX}.nonrRNA.unmerged2.fastq

#!/bin/bash
#BSUB -q Test128
#BSUB -n 1
#BSUB -J merge[1-9]

/tgac/software/testing/sortmerna/1.9/src/sortmerna-1.9/scripts/merge-paired-reads.sh /tgac/workarea/collaborators/traka/escape_pilot/raw_data_concatenated/PZ_${LSB_JOBINDEX}_R1.fastq  /tgac/workarea/collaborators/traka/escape_pilot/raw_data_concatenated/PZ_${LSB_JOBINDEX}_R2.fastq /tgac/workarea/collaborators/traka/escape_pilot/raw_data_concatenated/PZ_${LSB_JOBINDEX}_mergedfile.fastq

/tgac/software/testing/sortmerna/1.9/src/sortmerna-1.9/scripts/merge-paired-reads.sh /tgac/workarea/collaborators/traka/escape_pilot/raw_data_concatenated/TZ_${LSB_JOBINDEX}_R1.fastq  /tgac/workarea/collaborators/traka/escape_pilot/raw_data_concatenated/TZ_${LSB_JOBINDEX}_R2.fastq /tgac/workarea/collaborators/traka/escape_pilot/raw_data_concatenated/TZ_${LSB_JOBINDEX}_mergedfile.fastq

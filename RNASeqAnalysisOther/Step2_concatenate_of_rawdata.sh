#!/bin/bash
#BSUB -q Test128
#BSUB -n 1
#BSUB -J cat[1-9]


find /traka/escape_pilot/raw_data/PZ_${LSB_JOBINDEX}  *_R.fastq.gz | grep -i '\<P.*gz\>' | grep -i R1.fastq.gz$ | sort -n | xargs -i{} -n1 cat {} > /tgac/workarea/collaborators/traka/escape_pilot/raw_data_concatenated/PZ_${LSB_JOBINDEX}_R1.fastq.gz 

find /tgac/workarea/collaborators/traka/escape_pilot/raw_data/PZ_${LSB_JOBINDEX}  *_R.fastq.gz | grep -i '\<P.*gz\>' | grep -i R2.fastq.gz$ | sort -n | xargs -i{} -n1 cat {} > /tgac/workarea/collaborators/traka/escape_pilot/raw_data_concatenated/PZ_${LSB_JOBINDEX}_R2.fastq.gz

find /tgac/workarea/collaborators/traka/escape_pilot/raw_data/TZ_${LSB_JOBINDEX}  *_R.fastq.gz | grep -i '\<T.*gz\>' | grep -i R1.fastq.gz$ | sort -n | xargs -i{} -n1 cat {} > /tgac/workarea/collaborators/traka/escape_pilot/raw_data_concatenated/TZ_${LSB_JOBINDEX}_R1.fastq.gz 

find /tgac/workarea/collaborators/traka/escape_pilot/raw_data/TZ_${LSB_JOBINDEX}  *_R.fastq.gz | grep -i '\<T.*gz\>' | grep -i R2.fastq.gz$ | sort -n | xargs -i{} -n1 cat {} > /tgac/workarea/collaborators/traka/escape_pilot/raw_data_concatenated/TZ_${LSB_JOBINDEX}_R2.fastq.gz




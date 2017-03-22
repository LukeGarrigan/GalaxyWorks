#!/bin/bash -e 

#SBATCH -p tgac-short
#SBATCH -o slurm.%N.%j.out # STDOUT
#SBATCH -e slurm.%N.%j.err # STDERRi
#SBATCH -n 1




nameFile=14624_1#      
f1=$1
f2=$(echo $f1 | sed "s/_1.fastq/_2.fastq/")
./merge-paired-reads.sh <(gzip -dc $f1 ) <(gzip -dc $f2 ) sortRNA/merged/$(basename $f1 _1.fastq.gz).merged.fastq 


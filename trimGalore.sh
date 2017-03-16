#!/bin/bash -e 

#SBATCH -p tgac-short
#SBATCH -o slurm.%N.%j.out # STDOUT
#SBATCH -e slurm.%N.%j.err # STDERRi
#SBATCH -n 1


source fastqc-0.11.3 
source trim_galore-0.3.7


trim_galore -q 20 --phred33 --stringency 5 -length 30 --paired -o trimGaloreData/ --fastqc sortRNA/unmerged/$1.nonrRNA.unmerged.fastq sortRNA/unmerged/$1.nonrRNA.unmerged2.fastq








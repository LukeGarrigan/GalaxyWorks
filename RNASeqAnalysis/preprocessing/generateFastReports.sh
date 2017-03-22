#!/bin/bash -e 

#SBATCH -p tgac-short
#SBATCH -o slurm.%N.%j.out # STDOUT
#SBATCH -e slurm.%N.%j.err # STDERRi
#SBATCH -n 1



mkdir -p fastReports/
source fastqc-0.11.3
find $1 -name '*.fastq' | xargs -i{} -n1 sbatch -ptgac-short fastQC.sh {}



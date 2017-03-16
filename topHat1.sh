#!/bin/bash -e 

#SBATCH -p tgac-short
#SBATCH -o slurm.%N.%j.out # STDOUT
#SBATCH -e slurm.%N.%j.err # STDERRi
#SBATCH -n 1


source bowtie-2.2.9     


source tophat-2.0.14
genomeRef=reference/bifidobacteria_copy
tophat -p 4 --min-anchor-length 12 --max-multihits 20 -o /tgac/workarea/group-ig/Projects/Galaxy/EPS_JK2014/topHatData/$1 /tgac/workarea/group-ig/Projects/Galaxy/EPS_JK2014/reference/bifidobacteria_copy trimGaloreData/$1.nonrRNA.unmerged_val_1.fq trimGaloreData/$1.nonrRNA.unmerged2_val_2.fq

#14624_1#11.nonrRNA.unmerged2_val_2.fq 
#14624_1#10.nonrRNA.unmerged_val_1.fq  


#tophat -p 4 --min-anchor-length 12 --max-multihits 20 -o $datpath/Tophat_data/$nameFile${LSB_JOBINDEX} $genomeRef $datpath/TrimGalore_data_and_fastQC/$nameFile${LSB_JOBINDEX}.nonrRNA.unmerged1_val_1.fq $datpath/TrimGalore_data_and_fastQC/$nameFile${LSB_JOBINDEX}.nonrRNA.unmerged2_val_2.fq
~                                                                                                                                            
~                                                                                        

#!/bin/bash -e 
# will unzip the data without removing the zipped version
#gzip -dc $1 > RawData/unzipped/$(basename $1 .gz)
#fastqc RawData/unzipped/$(basename $1 .gz) --outdir=fastReports/
source gzip-1.6
gzip $1


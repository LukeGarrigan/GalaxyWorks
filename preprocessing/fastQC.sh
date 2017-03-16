#!/bin/bash -e 

# will run fast qc on the argument passed
fastqc $1 --outdir=fastReports/

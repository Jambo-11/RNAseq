#!/bin/bash

#SBATCH --mail-type=start,end,fail
#SBATCH --job-name="read_quality"
#SBATCH --nodes=1
#SBATCH --cpus-per-task=2
#SBATCH --time=24:00:00
#SBATCH --mem=25G
#SBATCH --mail-user=philipp.graber@students.unibe.ch

#load module 

USER_DIR="/data/courses/rnaseq/lncRNAs/Project1/users/pgraber"
DATA_DIR="/data/courses/rnaseq/lncRNAs/Project1/fastq"
OUTPUT_DIR=$USER_DIR/results

#Check for fastq directory and create one if none exists
if [ ! -d "$OUTPUT_DIR/fastqc" ]; then
    mkdir $OUTPUT_DIR/fastqc
fi

# go to fastq results directory 
cd $OUTPUT_DIR/fastqc

# Link data locally 
ln -s $DATA_DIR .





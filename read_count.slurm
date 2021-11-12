#!/bin/sh

#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=5G
#SBATCH --time=01:00:00
#SBATCH --job-name=RNAseq/rule1/read_count
#SBATCH --mail-user=philipp.graber@students.unibe.ch
#SBATCH --mail-type=begin,end,fail

DATA=$1
OUTPUT=$2 

for file in $(ls $DATA); do 
    LINE_COUNT=$(gunzip -c "${DATA}/${file}" | wc -l)  
    echo | awk '{print  x "\t" y}' x=$file y=$(($LINE_COUNT / 4)) >> $OUTPUT
done 
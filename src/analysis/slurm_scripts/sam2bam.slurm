#!/bin/bash

#SBATCH --job-name sam2bam                 
#SBATCH --ntasks 1                              
#SBATCH --time 2:00:00                                
#SBATCH --mem=10GB                               
#SBATCH --cpus-per-task 8                                  
#SBATCH --mail-user philipp.graber@students.unibe.ch            
#SBATCH --mail-type ALL                        
#SBATCH --array=1-24%12

REF_DIR="/data/courses/rnaseq/lncRNAs/Project1/references"
OUT_DIR="/data/courses/rnaseq/lncRNAs/Project1/users/pgraber/gen/analysis/output/mapping"
SAM_DATA_DIR="/data/courses/rnaseq/lncRNAs/Project1/users/pgraber/gen/analysis/output/mapping"

echo This is array task number $SLURM_ARRAY_TASK_ID

# Add module
module add UHTS/Analysis/samtools/1.8

# Create Slurm array  
FILE_ID=HD${SLURM_ARRAY_TASK_ID}

# Converting SAM directly to sorted BAM file
# -@ 7: ask for 8 with the --cpus-per-task option, but only specify 7 in sammtool command to leave one for the manager process
# -bS: -S option specifies that the input is in SAM format, while the -b option outputs to a BAM file

samtools view -bS -@ 7 -t ${REF_DIR}/GRCh38_latest_genomic.fa.fai ${SAM_DATA_DIR}/${FILE_ID}_L1.sam | samtools sort -@ 7 -o ${OUT_DIR}/${FILE_ID}_L1_sorted.bam 
samtools view -bS -@ 7 -t ${REF_DIR}/GRCh38_latest_genomic.fa.fai ${SAM_DATA_DIR}/${FILE_ID}_L2.sam | samtools sort -@ 7 -o ${OUT_DIR}/${FILE_ID}_L2_sorted.bam

# Creating BAM index files
samtools index ${OUT_DIR}/${FILE_ID}_L1_sorted.bam
samtools index ${OUT_DIR}/${FILE_ID}_L2_sorted.bam
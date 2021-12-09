#!/bin/bash

#SBATCH --job-name assembly                 
#SBATCH --ntasks 1                              
#SBATCH --time 2:00:00                                
#SBATCH --mem=10GB                               
#SBATCH --cpus-per-task 8                                  
#SBATCH --mail-user philipp.graber@students.unibe.ch            
#SBATCH --mail-type ALL                        
#SBATCH --array=1-24%12

# Make sure that the results directory exists
mkdir -p ./gen/analysis/output/assembly

REF_DIR="/data/courses/rnaseq/lncRNAs/Project1/references"
OUT_DIR="/data/courses/rnaseq/lncRNAs/Project1/users/pgraber/gen/analysis/output/assembly"
BAM_DATA_DIR="/data/courses/rnaseq/lncRNAs/Project1/users/pgraber/gen/analysis/output/mapping"
ANNOTATION_FILE="/data/courses/rnaseq/lncRNAs/Project1/references/gencode.v38.annotation.gff3"

echo This is array task number $SLURM_ARRAY_TASK_ID

# Add module
module add UHTS/Aligner/stringtie/1.3.3b

# Create Slurm array  
FILE_ID=HD${SLURM_ARRAY_TASK_ID}

# BAM input files have to be sorted 
# -G option: reference annotation file (in GTF or GFF3 format)
# TruSeq Stranded mRNA libraries: stringtie option is -rf
stringtie --rf -o ${OUT_DIR}/${FILE_ID}_L1.gtf -G $ANNOTATION_FILE ${BAM_DATA_DIR}/${FILE_ID}_L1_sorted.bam
stringtie --rf -o ${OUT_DIR}/${FILE_ID}_L2.gtf -G $ANNOTATION_FILE ${BAM_DATA_DIR}/${FILE_ID}_L2_sorted.bam 
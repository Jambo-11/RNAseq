#!/bin/bash

#SBATCH --job-name assembly_merge                
#SBATCH --ntasks 1                              
#SBATCH --time 2:00:00                                
#SBATCH --mem=10GB                               
#SBATCH --cpus-per-task 8                                  
#SBATCH --mail-user philipp.graber@students.unibe.ch            
#SBATCH --mail-type ALL                        

# Make sure that the results directory exists
mkdir -p ./gen/analysis/output/assembly

OUT_DIR="/data/courses/rnaseq/lncRNAs/Project1/users/pgraber/gen/analysis/output/assembly"
ASSEMBLY_DATA_DIR="/data/courses/rnaseq/lncRNAs/Project1/users/pgraber/gen/analysis/output/assembly"
ANNOTATION_FILE="/data/courses/rnaseq/lncRNAs/Project1/references/gencode.v38.annotation.gff3"

# Add module
module add UHTS/Aligner/stringtie/1.3.3b
# Create text file list with all GTF file
# Force output to be one entry per line (ls -1)
ls -1 ${ASSEMBLY_DATA_DIR}/*.gtf > ${ASSEMBLY_DATA_DIR}/assembly_GTF_list.txt

# Run stringtie in merge mode (reference guided)
stringtie --rf --merge -p 7 -o ${OUT_DIR}/assembly_merge -G $ANNOTATION_FILE ${ASSEMBLY_DATA_DIR}/assembly_GTF_list.txt
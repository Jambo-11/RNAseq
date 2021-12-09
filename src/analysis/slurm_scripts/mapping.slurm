#!/bin/bash

#SBATCH --job-name mapping                 
#SBATCH --ntasks 1                              
#SBATCH --time 24:00:00                                
#SBATCH --mem=10GB                               
#SBATCH --cpus-per-task 6                                  
#SBATCH --mail-user philipp.graber@students.unibe.ch            
#SBATCH --mail-type ALL                        
#SBATCH --array=1-24%12

# Make sure that the results directory exists
mkdir -p ./gen/analysis/output/mapping

REF_DIR="/data/courses/rnaseq/lncRNAs/Project1/users/pgraber/src/data/reference"
GENCODE_INDEX_DIR="/data/courses/rnaseq/lncRNAs/Project1/users/pgraber/src/data/hisat2_index/gencode"
OUT_DIR="/data/courses/rnaseq/lncRNAs/Project1/users/pgraber/gen/analysis/output/mapping"
RAW_DATA_DIR="/data/courses/rnaseq/lncRNAs/Project1/users/pgraber/src/data/raw_data"

echo This is array task number $SLURM_ARRAY_TASK_ID

# Load required modules 
module add UHTS/Aligner/hisat/2.2.1

# Build SLURM array
FILE_ID=HD${SLURM_ARRAY_TASK_ID}

#hisat2-build src/data/reference/GRCh38.p13.genome.fa ${GENCODE_INDEX_DIR}/genome
# (use prebuild index from hisat2 website)
# TruSeq Stranded mRNA libraries: hisat2 option is RF (fr-firststrand: dUTP based methods)
hisat2 --rna-strandness RF -x ${GENCODE_INDEX_DIR}/genome -1 ${RAW_DATA_DIR}/${FILE_ID}_L1_R1.fastq.gz -2 ${RAW_DATA_DIR}/${FILE_ID}_L1_R2.fastq.gz -S ${OUT_DIR}/${FILE_ID}_L1.sam
hisat2 --rna-strandness RF -x ${GENCODE_INDEX_DIR}/genome -1 ${RAW_DATA_DIR}/${FILE_ID}_L2_R1.fastq.gz -2 ${RAW_DATA_DIR}/${FILE_ID}_L2_R2.fastq.gz -S ${OUT_DIR}/${FILE_ID}_L2.sam
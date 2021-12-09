#!/bin/bash

#SBATCH --job-name quantification                 
#SBATCH --ntasks 1                              
#SBATCH --time 2:00:00                                
#SBATCH --mem=10GB                               
#SBATCH --cpus-per-task 8                                  
#SBATCH --mail-user philipp.graber@students.unibe.ch            
#SBATCH --mail-type ALL                        
#SBATCH --array=1-24%12

# Make sure that the results directory exists
mkdir -p ./gen/analysis/output/quantification

REF_DIR="/data/courses/rnaseq/lncRNAs/Project1/users/pgraber/src/data/reference"
OUT_DIR="/data/courses/rnaseq/lncRNAs/Project1/users/pgraber/gen/analysis/output/quantification"
ASSEMBLY_DIR="/data/courses/rnaseq/lncRNAs/Project1/users/pgraber/gen/analysis/output/assembly"
RAW_DATA_DIR="/data/courses/rnaseq/lncRNAs/Project1/users/pgraber/src/data/raw_data"

echo This is array task number $SLURM_ARRAY_TASK_ID

# Add module
module add UHTS/Assembler/cufflinks/2.2.1
module add UHTS/Analysis/kallisto/0.46.0

# Create Slurm array  
FILE_ID=HD${SLURM_ARRAY_TASK_ID}

# Kallisto build requires fasta files (transcriptomes = assemblies)
# Kallisto indexes can be downloaded but since we did de-novo assembly (to detect new lnRNA) we have to use gffread 
gffread ${ASSEMBLY_DIR}/assembly_merge.gtf -g ${REF_DIR}/GRCh38.p13.genome.fa -w ${ASSEMBLY_DIR}/assembly_merge.fa

# Build kallisto indexes with de-novo transcriptome assembly (fasta files)
# Only build one index (with merged assembly)
kallisto index -i ${OUT_DIR}/assembly_merge.idx ${ASSEMBLY_DIR}/assembly_merge.fa

# Run kallisto quant (strand-mode)
# Bootstrap mode is mandatory to perform differential expression in later step
kallisto quant --rf -i ${OUT_DIR}/assembly_merge.idx -b 50 -t 2 -o ${OUT_DIR}/${FILE_ID}_L1 ${RAW_DATA_DIR}/${FILE_ID}_L1_R1.fastq.gz ${RAW_DATA_DIR}/${FILE_ID}_L1_R2.fastq.gz
kallisto quant --rf -i ${OUT_DIR}/assembly_merge.idx -b 50 -t 2 -o ${OUT_DIR}/${FILE_ID}_L2 ${RAW_DATA_DIR}/${FILE_ID}_L2_R1.fastq.gz ${RAW_DATA_DIR}/${FILE_ID}_L2_R2.fastq.gz


#!/bin/bash

#SBATCH --job-name mapping                 
#SBATCH --ntasks 1                              
#SBATCH --time 24:00:00                                
#SBATCH --mem=10GB                               
#SBATCH --cpus-per-task 6                                  
#SBATCH --mail-user philipp.graber@students.unibe.ch            
#SBATCH --mail-type ALL                        
#SBATCH --array=1-100%10

REF_DIR="/data/courses/rnaseq/lncRNAs/Project1/references"
OUT_DIR="/data/courses/rnaseq/lncRNAs/Project1/users/pgraber/gen/analysis/output"

echo This is array task number $SLURM_ARRAY_TASK_ID

# Make sure that the results directory exists
mkdir -p ./gen/analysis/output/mapping

# Load required modules 
module add UHTS/Aligner/hisat/2.2.1

# Create variable containing filenames
cd ./src/data/raw_data/
FILES=$(find -name "*R1.fastq.gz")

# get specific file name, assign it to FQ1
FQ1=${FILES[$SLURM_ARRAY_TASK_ID]}

# edit the file name to refer to mate pair file and assign that name to FQ2 (set global option in sed)
FQ2=$(echo $FQ1 | sed 's/R1/R2/g')

# create an output file name
OUT=$(echo $FQ1 | sed 's/.R1.fastq.gz/.sam/g')

#hisat2-build references/GRCh38_latest_genomic.fa genome_index / run hisat2

#hisat2-build ${REF_DIR}/GRCh38_latest_genomic.fa genome_index
hisat2 -x genome_index -1 ${FQ1} -2 ${FQ2} -S ${OUT_DIR}/mapping/${OUT}

echo Files $FQ1 and $FQ2 were aligned by task number $SLURM_ARRAY_TASK_ID on $(date)

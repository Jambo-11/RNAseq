#!/bin/bash
#SBATCH --job-name fastqc                       
#SBATCH --ntasks 1                              
#SBATCH --time 05:00:00                                
#SBATCH --mem=10GB                               
#SBATCH --cpus-per-task 6                                  
#SBATCH --mail-user philipp.graber@students.unibe.ch            
#SBATCH --mail-type ALL                        
#SBATCH --array=1-100%3                                                

# Make sure that the results directory exists
mkdir -p ./gen/analysis/output/fastqc

# Load required modules (falquet)
module add UHTS/Quality_control/fastqc/0.11.9;

# Search all the fastq files from the "data" directory and generate the array
file=$(ls ./src/data/*.fastq.gz | sed -n ${SLURM_ARRAY_TASK_ID}p)

# Run quality analysis on each fastq file
fastqc -o ./gen/analysis/output/fastqc/ $file
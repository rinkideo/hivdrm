#!/bin/bash
# https://slurm.schedmd.com/sbatch.html
# https://wiki.rc.hms.harvard.edu/display/O2

#SBATCH --partition=priority        
#SBATCH --time=10-00:00:00              
#SBATCH --job-name=hivdrm
#SBATCH -c 10
#SBATCH --mem=160G 
#SBATCH --output=..../hivdrm_%j.out     
#SBATCH --error=..../hivdrm_%j.err  

date
# Code directory (kept in home)
INP_DIR=~/DRMV/hivdrm

cd $INP_DIR
module load conda/miniforge3/24.11
conda activate hivdrm_production1



python $INP_DIR/hivdrm_old.py \
--barcodes $INP_DIR/barcodes.csv \
--ref $INP_DIR/reference.fasta \
--threads 10 \
$INP_DIR/reads_R1.fq.gz $CODE_DIR/synthetic_546nt_data/synthetic_simEF_v15/reads_R2.fq.gz


conda deactivate

date
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

# input files and code directory
INP_DIR= ~/path_to_code_and_inp_files.

cd $INP_DIR
module load conda/miniforge3/24.11
conda activate hivdrm_production

# Scratch working/output directory
cd $OUT_DIR


python $INP_DIR/hivdrm_modified.py \
--barcodes $INP_DIR/barcodes.csv \
--ref $INP_DIR/referencefile.fasta \
--threads 10 \
$INP_DIR/reads_R1.fq.gz $INP_DIR/reads_R2.fq.gz --outdir $OUT_DIR/outputfolder


conda deactivate

date
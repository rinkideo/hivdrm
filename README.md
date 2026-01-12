# hivdrm
Detect HIV Drug Resitant Mutations using amplicon sequencing data

A production-ready re-implementation of https://www.ncbi.nlm.nih.gov/pmc/articles/PMC7699007/,
https://github.com/Wei-Shao/HIV-DRLink.

The current version of hivdrm script is the  modifed version of https://github.com/naumenko-sa/hivdrm

## Install

- Install conda (if not already present): https://docs.conda.io/projects/conda/en/latest/user-guide/install/linux.html
- Install mamba: `conda install mamba -n base -c conda-forge`
- Clone hivdrm: `git clone https://github.com/rinkideo/hivdrm.git`
- `cd hivdrm`
- Create conda environment to run hivdrm: `mamba env create -n hivdrm_production --file environment.yml`
- add hivdrm to PATH: `export PATH=/path/to/hivdrm:$PATH` in .bashrc or .bash_profile

## Run
```bash
#SBATCH MEMORY REQUREMENTS
conda activate hivdrm_production
cd /path/project
hivdrm_new_modifiesd_rd.py \
--barcodes barcodes.csv \
--reference reference.fasta \
--threads 10 \
r1.fq.gz r2.fq.gz --outdir outputfolder_name

conda deactivate
```

Example of barcodes.csv:
```
Sample_ID,Primers,F-Linkers,R-Linkers
Samp1,F1/R1,CGCCTG,GCCATG
Samp2,F1/R2,CGCCTG,TACAAG
```

Example of reference.fasta:
```
>EF602219.1 HIV-1 isolate 1779 from South Africa pol protein (pol) gene, partial cds edited
CGCCTGAATCCATATAACACTCCAATATTTGCCATAAAAAAGAAGGACAGTACTAAGTGGAGAAAATTAGTAGATTTCAGGGAACTTAATAAAAGAACTCAAGACTTTTGGGAAGTTCAATTAGGAATACCACATCCAGCAGGATTAAAAAAGAAAAAATCAGTGACAGTACTGGATGTGGGGGATGCATATTTTTCAGTTCCTTTAGATGAAGGCTTCAGAAAATATACTGCATTCACCATACCTAGTATAAACAATGAAACACCAGGGATTAGATATCAATATAATGTGCTCCCAGGATCACCAGCAATATTCCAAAGTAGCATGACAAAAATCTTAGAGCCCTTTAGAGCAAGAAATCCAGAAATAGTCATCTATCAATATATGGATGACTTGTATGTGGGATCTGACTTAGAAATAGGGCAACATAGAGCAAAAATAGAGGAATTAAGAGCACATTTATTAGGGTGGGGATTTACCACWCCAGACAAGAAACATCAGAAGGAACCCCCATTTCTTTGGATGGGGTACGAACTCCATCCTGACAAATGGACAGTNNNNNNNNNNCTAGCAGGATGACTTCGATACCCATGGC
```

Barcode processing steps for libraries with multiple samples and blastn step benefit a lot from multithreading. Consider running on a server/cluster with 10 threads/20G RAM.

## Output

- DRM.xlsx - 1st sheet - DRM stats, then one sheet per sample
- freq.xlsx - barcode stats, per sample all and top allele frequencies
- Other intermediate files from all the steps


To check the older version of script :
## Run
```bash
#SBATCH MEMORY REQUREMENTS
conda activate hivdrm_production
cd /path/project
hivdrm_old.py \
--barcodes barcodes.csv \
--reference reference.fasta \
--threads 10 \
r1.fq.gz r2.fq.gz 

conda deactivate
```

## Uninstall

- `conda remove --name hivdrm_production --all`

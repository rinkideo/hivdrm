# hivdrm (modified fork)

Detect HIV Drug Resistant Mutations using amplicon sequencing data.

This repository is a modified derivative of the original hivdrm pipeline:
https://github.com/naumenko-sa/hivdrm  
and its underlying methodology:
https://www.ncbi.nlm.nih.gov/pmc/articles/PMC7699007/,  
https://github.com/Wei-Shao/HIV-DRLink.

Pipeline structure, inputs, and output file names remain unchanged from upstream.
This fork introduces robustness and output-handling improvements (see below).

## Differences from upstream

This fork includes the following modifications:

- **Consensus generation**
  - Family size cap removed
  - 80% threshold applied for consensus calling

- **Output directory handling**
  - Hardcoded output paths removed from `hivdrm.py`
  - Output directory is now passed dynamically via `hivdrm.sh`

- **Step 9 (Sierra upload) robustness**
  - Recent `sierrapy` versions produce chunked output files, which cause the upstream pipeline to fail
  - Chunked Sierra outputs are merged automatically, allowing the pipeline to complete successfully

- **Sequence length robustness**
  - Consensus generation no longer fails if sequences differ in length
  - Sequences with incompatible lengths are skipped
  - Sequences differing by ≤2 bp are padded prior to downstream processing

These changes affect **output values and output handling only**.  
Input files, number of steps, and output file names remain the same as upstream.

## Install

- Install conda (if not already present): https://docs.conda.io/projects/conda/en/latest/user-guide/install/linux.html
- Install mamba:  
  `conda install mamba -n base -c conda-forge`
- Clone the repository:
  ```bash
  git clone https://github.com/rinkideo/hivdrm.git
  cd hivdrm


- Create conda environment : mamba env create -n hivdrm_production --file environment.yml
- add hivdrm to PATH: export PATH=/path/to/hivdrm:$PATH

## Run
- Note that the output directory must be provided explicitly.
```bash
#SBATCH MEMORY REQUREMENTS
conda activate hivdrm_production
cd /path/project
hivdrm_modified.py \
--barcodes barcodes.csv \
--reference reference.edited.fasta \
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

## Output

- DRM.xlsx - 1st sheet - DRM stats, then one sheet per sample
- freq.xlsx - barcode stats, per sample all and top allele frequencies
- Other intermediate files from all the steps


## Synthetic dataset for validation (optional)

This repository includes a small synthetic dataset intended to demonstrate the
effects of the modifications introduced in this fork and to support reproducible testing.

The synthetic dataset includes:
- Example input FASTQ files
- Expected DRM calls
- Expected allele frequency outputs

These files can be used to:
- Verify correct pipeline execution
- Compare output behavior between the upstream and modified implementations
- Validate consensus and output-handling logic changes

The synthetic dataset is provided for demonstration and testing purposes only
and does not represent biological samples.



# Synthetic dataset for pipeline validation

This directory contains a synthetic dataset generated to validate the modified
`hivdrm` pipeline and to demonstrate the effects of the changes introduced in this fork.

The dataset was designed to reproduce a realistic high-throughput amplicon
sequencing scenario while allowing direct comparison between the upstream and
modified implementations.

## Purpose

The primary goals of this synthetic dataset are to:

- Verify that all pipeline steps execute successfully end-to-end
- Confirm that recent modifications are correctly implemented
- Demonstrate differences in output behavior between the upstream and modified scripts
- Provide expected DRM calls and frequency outputs for reproducibility checks

This dataset is intended for testing and validation only and does not represent
biological samples.

## Dataset description

Synthetic reads were generated to simulate an Illumina-like paired-end sequencing
run covering the HIV-1 Reverse Transcriptase (RT) region
(HXB2 positions 54–235).

The synthetic sequences were constructed to test multiple pipeline edge cases,
including:

- Variable family sizes
- Consensus generation behavior under an 80% threshold
- Sequences with minor length differences
- Robust handling of output generation and downstream processing

## Contents

Typical directory structure:

```text
synthetic_data/
├── r1.fq.gz
├── r2.fq.gz
├── barcodes.csv
├── reference.fasta
└── expected_DRM.xlsx
└── expected_freq.xlsx

- **Input files** replicate a standard `hivdrm` run configuration.
- **Expected output files** represent the intended results produced by the modified pipeline.

## How to use

1. Configure `hivdrm.sh` to point to the synthetic input files located in this directory.
2. Run the pipeline using the modified implementation.
3. Compare the generated outputs against the files in `expected_output/`.

This comparison can be used as a lightweight validation check after code changes
or dependency updates.

## Notes

- Output file names and pipeline steps are identical to the upstream implementation.
- Differences are limited to output values and robustness of execution.
- This dataset is provided for transparency and reproducibility.


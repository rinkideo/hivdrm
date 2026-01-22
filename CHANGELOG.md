This repository is a modified derivative of the upstream hivdrm pipeline (MIT License).
Upstream release history is preserved in HISTORY.md.

## v0.1.0 (based on upstream v0.0.1, 2022-01-31)
- Forked from upstream release v0.0.1

## v0.1.1
- Modified consensus generation logic in `hivdrm.py`:
  - Removed the family size cap
  - Applied an 80% threshold for consensus calling
- Refactored output directory handling:
  - Removed hardcoded output paths from `hivdrm.py`
  - Output directory is now passed dynamically via `hivdrm.sh`
- Fixed step 9 (Sierra upload) output handling:
  - Merged chunked outputs produced by recent `sierrapy` versions to prevent downstream failures
- Improved robustness to sequence length mismatches:
  - Sequences with incompatible lengths are skipped prior to consensus processing
  - Sequences differing by only 1–2 bp are padded to maintain alignment consistency
- Changes affect output values and output handling only; input files, pipeline steps, and output file names remain unchanged

## v0.1.2
- Updated `hivdrm.sh` to adjust Slurm submission and runtime configuration

## v0.1.3
- Added synthetic dataset with expected DRM and frequency outputs for validation and testing


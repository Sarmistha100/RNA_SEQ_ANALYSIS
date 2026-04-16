#!/bin/bash

echo "===== RNA-seq PIPELINE STARTED ====="

# Step 1: Trimming
bash scripts/trimming.sh

# Step 2: Alignment
bash scripts/alignment.sh

# Step 3: Quantification
bash scripts/quantification.sh

# Step 4: DESeq2 analysis
Rscript scripts/deseq2_analysis.R

echo "===== PIPELINE COMPLETED SUCCESSFULLY ====="

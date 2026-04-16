#!/bin/bash

echo "Running featureCounts..."

cd ~/Documents/project_2025/quantification_featureCounts

for file in ../alignment_hisat2/*_sorted.bam
do
  base=$(basename $file .bam)

  featureCounts -p \
  -t exon -g gene_id \
  -a ../genome_arabidopsis/Arabidopsis_thaliana.TAIR10.57.gtf \
  -o ${base}.txt $file
done

echo "Quantification completed"

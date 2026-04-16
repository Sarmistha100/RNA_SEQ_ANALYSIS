#!/bin/bash

echo "Processing BAM files..."

cd ~/Documents/project_2025/alignment_hisat2

for sample in 204 206 210 212 216 218
do
  # Convert + sort
  samtools sort SRR10207${sample}.sam -o SRR10207${sample}_sorted.bam

  # Index BAM
  samtools index SRR10207${sample}_sorted.bam
done

echo "BAM processing completed"

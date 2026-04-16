#!/bin/bash

echo "Starting alignment..."

cd ~/Documents/project_2025/alignment_hisat2

for sample in 204 206 210 212 216 218
do
  hisat2 -p 4 \
  -x ../index_hisat2/genome \
  -1 ../trimming_data/SRR10207${sample}_P_1.fastq.gz \
  -2 ../trimming_data/SRR10207${sample}_P_2.fastq.gz \
  -S SRR10207${sample}.sam
done

echo "Alignment completed"

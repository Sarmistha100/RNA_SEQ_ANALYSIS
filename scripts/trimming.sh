#!/bin/bash

echo "Starting trimming..."

cd ~/Documents/project_2025/trimming_data

for sample in 204 206 210 212 216 218
do
  java -jar ~/Documents/project_2025/bioinformatics_tools/Trimmomatic-0.39/trimmomatic-0.39.jar PE -phred33 \
  ../raw_data/SRR10207${sample}_1.fastq.gz \
  ../raw_data/SRR10207${sample}_2.fastq.gz \
  SRR10207${sample}_P_1.fastq.gz \
  SRR10207${sample}_U_1.fastq.gz \
  SRR10207${sample}_P_2.fastq.gz \
  SRR10207${sample}_U_2.fastq.gz \
  ILLUMINACLIP:~/Documents/project_2025/bioinformatics_tools/Trimmomatic-0.39/adapters/TruSeq3-PE.fa:2:30:10 \
  SLIDINGWINDOW:4:15 MINLEN:36
done

echo "Trimming completed"

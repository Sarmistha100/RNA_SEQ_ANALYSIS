# RNA-seq Analysis Pipeline (Arabidopsis thaliana)

End-to-end RNA-seq workflow from raw sequencing data to differential gene expression (DGE) analysis.

---

## Overview

📌 Overview  
This project implements a complete, reproducible RNA-seq analysis workflow for *Arabidopsis thaliana*, from raw sequencing data to differential gene expression (DGE) analysis. The pipeline is modular, automated via shell scripts, and runs in a Linux environment (tested on Ubuntu 22.04).

This workflow was developed as part of a learning exercise based on a published protocol from : https://doi.org/10.1002/cpz1.1054. While inspired by this reference, all analyses were independently executed, customized, and validated. The results presented here are generated from real data and reflect a fully functional end-to-end implementation.
---

## 🧬 Workflow

```
Raw FASTQ → FastQC → Trimmomatic → HISAT2 Alignment → SAMtools → featureCounts → DESeq2 DGE
```

## ⚙️ Software Requirements

| Tool                    | Version | Installation                   |
| ----------------------- | ------- | ------------------------------ |
| FastQC                  | Latest  | `sudo apt install fastqc`      |
| Trimmomatic             | 0.39    | Manual download                |
| HISAT2                  | 2.2.1   | `sudo apt install hisat2`      |
| SAMtools                | Latest  | `sudo apt install samtools`    |
| featureCounts (subread) | Latest  | `sudo apt install subread`     |
| R                       | 4.3+    | `sudo apt install r-base`      |
| SRA Toolkit             | Latest  | NCBI                           |
| Java                    | OpenJDK | `sudo apt install default-jre` |

### Install all core tools:

```bash
sudo apt update
sudo apt install fastqc hisat2 samtools subread r-base default-jre wget unzip
```

### R Packages:

```r
install.packages("BiocManager")
BiocManager::install(c("DESeq2", "EnhancedVolcano"))
install.packages(c("ggplot2", "pheatmap"))
```

---

## Data Download

Dataset: **NCBI SRA – PRJNA575031**

```bash
# Example for one sample
prefetch SRR10207204
fasterq-dump SRR10207204 --split-files --outdir raw_data/
gzip raw_data/SRR10207204_*.fastq
```

Repeat for:

```
SRR10207204
SRR10207206
SRR10207210
SRR10207212
SRR10207216
SRR10207218
```

### Sample Metadata (`samplesheet.csv`)

```
sample,condition
SRR10207204,control
SRR10207206,control
SRR10207210,treated
SRR10207212,treated
SRR10207216,control
SRR10207218,treated
```

---

## 🌱 Reference Genome & Annotation

Downloaded from Ensembl Plants (TAIR10):

### Genome

```bash
wget https://ftp.ebi.ac.uk/ensemblgenomes/pub/release-57/plants/fasta/arabidopsis_thaliana/dna/Arabidopsis_thaliana.TAIR10.dna.toplevel.fa.gz
gunzip Arabidopsis_thaliana.TAIR10.dna.toplevel.fa.gz
```

### Build HISAT2 index

```bash
hisat2-build Arabidopsis_thaliana.TAIR10.dna.toplevel.fa genome_index
```

### Annotation

```bash
wget https://ftp.ebi.ac.uk/ensemblgenomes/pub/release-57/plants/gtf/arabidopsis_thaliana/Arabidopsis_thaliana.TAIR10.57.gtf.gz
gunzip Arabidopsis_thaliana.TAIR10.57.gtf.gz
```

---

## 📁 Project Structure

```
project_RNA_SEQ/
├── scripts/
├── raw_data/                      
├── trimming_data/
├── alignment_hisat2/
├── quantification_featureCounts/
├── results/
├── ref/
├── run_all.sh
└── README.md
```

---

## 🚀 Pipeline Execution

Run the complete workflow:

```bash
bash run_all.sh
```

---

## 📊 Results

Outputs (in `results/`):

* PCA plot
* Volcano plot
* MA plot
* Heatmap
* DEG tables (CSV)

---

## 🔁 Reproducibility

All steps are automated and reproducible:

```bash
bash run_all.sh
```

---

## 📚 References

* Villalobos-Escobedo et al. (2024). RNA-Seq Data Analysis: A Practical Guide for Model and Non-Model Organisms. *Current Protocols*.
* Love et al. (2014). Moderated estimation of fold change and dispersion for RNA-seq data with DESeq2. *Genome Biology*.

---

## 📝 Notes
**Learning implementation** → **Production-ready results**:
- Automated pipeline execution
- DESeq2 integration 
- Reproducible via `bash run_all.sh`

---

## 👩‍💻 Author

**Sarmistha Nayak**
Bioinformatics | Genomics | RNA-seq Analysis


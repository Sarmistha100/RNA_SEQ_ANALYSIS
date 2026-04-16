library(DESeq2)
library(ggplot2)
library(EnhancedVolcano)
library(pheatmap)

# Input
countData <- read.delim("quantification_featureCounts/final_matrix.txt",
                        header=FALSE)

# Fix column names manually
colnames(countData) <- c("gene",
                         "Control_1","Control_2","Control_3",
                         "Treatment_1","Treatment_2","Treatment_3")

rownames(countData) <- countData$gene
countData <- countData[,-1]

# Metadata
condition <- factor(c("Control","Control","Control",
                      "Treatment","Treatment","Treatment"))

colData <- data.frame(row.names=colnames(countData), condition)

# DESeq2
dds <- DESeqDataSetFromMatrix(countData=countData,
                              colData=colData,
                              design=~condition)

dds <- dds[rowSums(counts(dds)) > 10,]
dds <- DESeq(dds)

res <- results(dds)
res <- res[order(res$padj),]

# Output DEG table
write.csv(res, "results/DEG_full.csv")

deg <- subset(res, padj < 0.05 & abs(log2FoldChange) > 1)
write.csv(deg, "results/DEG_filtered.csv")

# PCA
rld <- rlog(dds)
png("results/PCA.png")
plotPCA(rld, intgroup="condition")
dev.off()

# Volcano
png("results/volcano.png")
EnhancedVolcano(res,
                lab=rownames(res),
                x='log2FoldChange',
                y='pvalue')
dev.off()

# MA plot
png("results/MA_plot.png")
plotMA(res)
dev.off()

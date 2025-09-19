# MGA-GE

This repository contains analysis workflows and figure scripts for genome-resolved metagenomics of the gastrointestinal epithelium microbiome in cattle.  
It includes data preprocessing, assembly, binning, dereplication, genome quality assessment, abundance estimation, and visualization.

---

## Repository Structure

- **figure/** – R scripts for data visualization  
  Includes bar plots, stacked bar plots, box plots, bubble plots (KEGG/functional categories), gene locus plots, polar bar plots, sankey diagrams, sunburst plots, and scatter plots with marginal histograms.  
  - Bar Plot.R  
  - Box Plot.R  
  - Bubble Plot.R  
  - Gene Locus Plot.R  
  - Polar Bar Plot.R  
  - Sankey Diagram.R  
  - Scatter plot with marginal histograms.R  
  - Stacked Bar Plot.R  
  - Sunburst Plot.R  

- **workflows/** – Workflow documentation  
  Stepwise pipelines for quality control, assembly (single-sample and co-assembly), binning (SemiBin2, BAM preparation), dereplication (dRep) and quality check (CheckM2), and abundance profiling (CoverM).  
  - Quality control.md  
  - Assembly.md  
  - Binning.md  
  - CoverM.md  
  - dRep_CheckM.md  

- **README.md** – Project overview

---

## Requirements

- **QC & Assembly**: `fastp`, `bwa`, `samtools`, `metaSPAdes`, `megahit`  
- **Binning**: `SemiBin2`, `metawrap`  
- **Dereplication & QC**: `dRep`, `CheckM2`  
- **Abundance estimation**: `CoverM`  
- **Visualization**: R packages `ggplot2`, `patchwork`, `cowplot`, `gggenes`, `GOplot`, `plotly`, `networkD3`, etc.  

---

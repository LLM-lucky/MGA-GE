# MGA-GE

This repository contains analysis workflows and figure scripts for genome-resolved metagenomics of the gastrointestinal epithelium microbiome in cattle.  
It includes data preprocessing, assembly, binning, dereplication, genome quality assessment, abundance estimation, and visualization.

---

## Repository Structure

MGA-GE/
│
├── figure/ # R scripts for data visualization
│ ├── Bar Plot.R
│ ├── Box Plot.R
│ ├── Bubble Plot.R
│ ├── Gene Locus Plot.R
│ ├── Polar Bar Plot.R
│ ├── Sankey Diagram.R
│ ├── Scatter plot with marginal histograms.R
│ ├── Stacked Bar Plot.R
│ └── Sunburst Plot.R
│
├── workflows/ # Workflow documentation
│ ├── Assembly.md
│ ├── Binning.md
│ ├── CoverM.md
│ ├── Quality control.md
│ └── dRep_CheckM.md
│
└── README.md


---

## Contents

- **Workflows**  
  Stepwise pipelines for:
  - Quality control  
  - Assembly (single-sample and co-assembly)  
  - Binning (SemiBin2, BAM preparation)  
  - Dereplication (dRep) and quality check (CheckM2)  
  - Abundance profiling (CoverM)  

- **Figures**  
  R scripts for generating publication-ready plots:
  - Bar plots and stacked bar plots  
  - Box plots  
  - Bubble plots (KEGG/functional categories)  
  - Gene locus plots  
  - Polar bar plots  
  - Sankey diagrams  
  - Sunburst plots  
  - Scatter plots with marginal histograms  

---

## Requirements

- **QC & Assembly**: `fastp`, `bwa`, `samtools`, `metaSPAdes`, `megahit`  
- **Binning**: `SemiBin2`, `metawrap`  
- **Dereplication & QC**: `dRep`, `CheckM2`  
- **Abundance estimation**: `CoverM`  
- **Visualization**: R packages `ggplot2`, `patchwork`, `cowplot`, `gggenes`, `GOplot`, `plotly`, `networkD3`, etc.  

---

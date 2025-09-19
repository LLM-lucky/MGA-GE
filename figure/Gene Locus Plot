########################################## Gene Locus Plot ###############################

library(gggenes)
library(ggplot2)
library(openxlsx)

data <- read.xlsx("基因覆盖度检验.xlsx", sheet = "Sheet1")
data$forward <- ifelse(data$strand == "forward", TRUE, FALSE)

ggplot(
  data,
  aes(xmin = start, xmax = end, y = molecule, fill = gene, forward = forward, label = gene)
) +
  geom_gene_arrow(
    arrowhead_height = unit(5, "mm"),
    arrowhead_width  = unit(2, "mm"),
    arrow_body_height = grid::unit(5, "mm")
  ) +
  geom_gene_label(align = "centre") +
  scale_fill_manual(
    values = c("#7f96c2","#a97aaa","#73c375","#eb8d84","#e7dfc9","#f3c4d8","#b0e0e1","#dff2d9"),
    limits = c("ptb","buk","secA","wecB","asp3","asp2","asp1","unknown")
  ) +
  facet_wrap(~ molecule, scales = "free", ncol = 1) +
  xlab("Locus length(bp)") + ylab("") +
  theme_genes() +
  theme(
    axis.text.x  = element_text(colour = "black", size = 7),
    axis.text.y  = element_text(colour = "black", size = 12),
    axis.title.y = element_text(size = 12),
    axis.title.x = element_text(size = 12)
  )

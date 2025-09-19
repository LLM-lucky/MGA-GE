########################################## Stacked Bar Plot ###############################

library(ggplot2)
library(RColorBrewer)
library(ggsci)

n <- read.csv("门BGC.csv", header = TRUE)

P1 <- ggplot(n, aes(x = G1, y = BGC_count_Mb, fill = T1)) + 
  geom_bar(stat = "identity", width = 0.8) + 
  theme_test() +
  ylab("Percentage at phylum level (%)") +
  scale_fill_manual(
    values = c("#3c5488","#91d1c2","#8491b4","#f39b7f","#00a087","#4dbbd5","#d9d9d9"),
    limits = c("RiPPs","NRPS","Terpene","PKSother","PKSI","PKS-NRP_Hybrids","Others")
  ) +
  scale_x_discrete(
    limits = c("Bacteroidota","Bacillota_A","Pseudomonadota","Spirochaetota","Thermoplasmatota",
               "Desulfobacterota","Bacillota_I","Bacillota_C","Methanobacteriota","Others")
  ) +
  theme(
    axis.text.x  = element_text(colour = "black", size = 12, vjust = 1, hjust = 1.2, angle = 45),
    axis.text.y  = element_text(colour = "black", size = 12),
    axis.title.y = element_text(size = 12),
    axis.title.x = element_text(size = 12)
  )

P1

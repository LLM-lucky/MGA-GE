############################# Bubble Plot  #######################

library(GOplot)
library(ggplot2)

circ <- read.csv("核心和附属KO.csv", header = TRUE, sep = ",")

ggplot(circ, aes(x = accessory, y = core, size = count, color = adj_pval)) +  
  geom_point(alpha = 0.7) +  
  scale_color_gradient(low = "blue", high = "red") +  
  labs(title = "Bubble Plot of KEGG Terms", x = "accessory", y = "core") +  
  theme_minimal()

########################################## Polar Bar Plot ###############################

library(ggplot2)

data <- read.csv("区段.csv", header = TRUE, sep = ",")

data$Tissue <- factor(
  data$Tissue,
  levels = c("A1","A2","A3","A4","A5","A6","A7","A8","A9","B1"),
  labels = c("Rumen","Reticulum","Omasum","Abomasum","Duodenum","Jejunum","Ileum","Cecum","Colon","Rectum")
)

ggplot(data, aes(x = Tissue, y = Number, fill = KOs)) +
  geom_bar(stat = "identity", width = 1, colour = "white", size = 0.25) +
  coord_polar(theta = "x", start = 0) +
  theme_light() +
  scale_fill_manual(values = c("#7091BB")) +
  theme(
    panel.background  = element_blank(),
    panel.grid.major  = element_line(colour = "grey80", size = .25),
    axis.text.y       = element_text(size = 11, colour = "black"),
    axis.line.y       = element_line(size = 0.25),
    axis.text.x       = element_text(size = 11, colour = "black")
  )

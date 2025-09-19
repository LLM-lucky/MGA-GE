########################################## Bar Plot ###############################

library(ggplot2)

data <- data.frame(
  Quality = c("Complete", "High-quality", "Medium-quality"),
  Count   = c(1859, 1009, 2735)
)

ggplot(data, aes(x = Quality, y = Count, fill = Quality)) +
  geom_bar(stat = "identity", width = 0.7) +
  scale_fill_manual(values = c(
    "Complete"      = "#4daf4a",
    "High-quality"  = "#377eb8",
    "Medium-quality"= "#ff7f00"
  )) +
  labs(
    title = "Number of vOTUs by Quality",
    x     = "Quality",
    y     = "Count"
  ) +
  theme_minimal() +
  theme(
    legend.position = "none",
    axis.text.x     = element_text(angle = 45, hjust = 1, size = 12),
    axis.text.y     = element_text(size = 12),
    axis.title      = element_text(size = 14)
  )

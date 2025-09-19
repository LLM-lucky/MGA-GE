############################################# Scatter plot with marginal histograms #########################

library(ggplot2)
library(dplyr)
library(readr)
library(patchwork)
library(cowplot)

df <- read.csv("MAG.csv")

df <- df %>%
  mutate(Quality_Label = case_when(
    Completeness >= 90 & Contamination <= 5 ~ "High-quality",
    Completeness >= 50 & Contamination <= 10 ~ "Medium-quality",
    TRUE ~ "Low-quality"
  ))

quality_colors <- c("High-quality" = "#79a3cd", "Medium-quality" = "#c7747e")
method_colors  <- c("DM" = "#c7afd3", "CM" = "#99b7b2")

p_main <- ggplot(df, aes(x = Completeness, y = Contamination, color = Quality_Label)) +
  geom_point(size = 1.2) +
  scale_color_manual(values = quality_colors) +
  geom_vline(xintercept = c(50, 90), linetype = "dashed", color = "black") +
  geom_hline(yintercept = c(5, 10), linetype = "dashed", color = "black") +
  theme_classic(base_size = 12) +
  labs(x = "Completeness (%)", y = "Contamination (%)", color = "Genome quality")

p_top <- ggplot(df, aes(x = Completeness, fill = Method)) +
  geom_histogram(binwidth = 2, position = "stack", color = "black", size = 0.2) +
  scale_fill_manual(values = method_colors) +
  theme_classic() +
  theme(axis.title.x = element_blank(),
        axis.text.x  = element_blank(),
        axis.ticks.x = element_blank(),
        legend.position = "none") +
  labs(y = "Genome number")

p_right <- ggplot(df, aes(x = Contamination, fill = Method)) +
  geom_histogram(binwidth = 0.25, position = "stack", color = "black", size = 0.2) +
  scale_fill_manual(values = method_colors) +
  coord_flip() +
  theme_classic() +
  theme(axis.title.y = element_blank(),
        axis.text.y  = element_blank(),
        axis.ticks.y = element_blank(),
        legend.position = "none") +
  labs(x = "Genome number")

legend_plot <- ggplot(df, aes(x = Method, fill = Method)) +
  geom_bar() +
  scale_fill_manual(values = method_colors) +
  theme_void() +
  theme(legend.position = "right")
legend <- cowplot::get_legend(legend_plot)

final_plot <- (p_top + plot_spacer()) /
  (p_main + p_right + plot_layout(widths = c(4, 1))) +
  plot_layout(heights = c(1.2, 4)) |
  patchwork::wrap_elements(legend)

final_plot

############################ Sunburst plot #########################

library(plotly)
library(htmlwidgets)
library(webshot2)

labels <- c(
  "Others", "RiPPs", "NRPS", "Terpene", "PKSother", "PKSI", "PKS-NRP_Hybrids",
  "arylpolyene", "betalactone", "phosphonate",
  "RRE-containing", "ranthipeptide"
)

parents <- c(
  "Total BGCs", "Total BGCs", "Total BGCs", "Total BGCs", "Total BGCs", "Total BGCs", "Total BGCs",
  "Others", "Others", "Others",
  "RiPPs", "RiPPs"
)

values <- c(
  469, 460, 190, 53, 23, 3, 2,
  246, 83, 50,
  161, 148
)

total_bgc <- sum(values[1:7])

text_labels <- c(
  paste0("Others\n", round(values[1]/total_bgc*100, 1), "%"),
  paste0("RiPPs\n", round(values[2]/total_bgc*100, 1), "%"),
  paste0("NRPS\n", round(values[3]/total_bgc*100, 1), "%"),
  paste0("Terpene\n", round(values[4]/total_bgc*100, 1), "%"),
  paste0("PKSother\n", round(values[5]/total_bgc*100, 1), "%"),
  paste0("PKSI\n", round(values[6]/total_bgc*100, 1), "%"),
  paste0("PKS-NRP_Hybrids\n", round(values[7]/total_bgc*100, 1), "%"),
  paste0("arylpolyene\n", values[8]),
  paste0("betalactone\n", values[9]),
  paste0("phosphonate\n", values[10]),
  paste0("RRE-containing\n", values[11]),
  paste0("ranthipeptide\n", values[12])
)

fig <- plot_ly(
  labels = labels,
  parents = parents,
  values = values,
  type = "sunburst",
  branchvalues = "total",
  text = text_labels,
  textinfo = "text"
)

fig

htmlwidgets::saveWidget(fig, "sunburst_temp.html")
webshot2::webshot("sunburst_temp.html", file = "sunburst_plot.pdf", vwidth = 1000, vheight = 800)

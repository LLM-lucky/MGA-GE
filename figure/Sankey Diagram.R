########################################## Sankey Diagram ###############################

library(networkD3)
library(htmlwidgets)
library(tidyverse)

data <- read.csv("host.csv", header = TRUE, fileEncoding = "GBK")

links <- data %>%
  transmute(source = Domain, target = Phylum, count) %>%
  bind_rows(data %>% transmute(source = Phylum, target = Class,  count)) %>%
  bind_rows(data %>% transmute(source = Class,  target = Order,  count)) %>%
  bind_rows(data %>% transmute(source = Order,  target = Family, count)) %>%
  bind_rows(data %>% transmute(source = Family, target = Genus,  count)) %>%
  group_by(source, target) %>%
  summarise(Value = sum(count), .groups = "drop")

nodes <- data.frame(name = unique(c(links$source, links$target)))

links <- links %>%
  mutate(
    source = match(source, nodes$name) - 1,
    target = match(target, nodes$name) - 1
  )

fixed_colors <- list(
  "Bacillota_A"="#276d9e","Bacteroidota"="#5e3886","Pseudomonadota"="#c72520",
  "Bacillota_C"="#399139","Bacillota"="#af6a06","Methanobacteriota"="#fdd326",
  "Spirochaetota"="#cc6966","Cyanobacteriota"="#fdbb84","Actinomycetota"="#67a9cf",
  "Patescibacteria"="#8c96c6","Eremiobacterota"="#e5c494","Fibrobacterota"="#c27eb5",
  "Asgardarchaeota"="#a28c7f","Campylobacterota"="#fb9a99","Desulfobacterota"="#33a02c",
  "Verrucomicrobiota"="#b2df8a","Chloroflexota"="#a6cee3","Elusimicrobiota"="#c2a5cf"
)

colourScale <- JS(sprintf(
  'd3.scaleOrdinal()
    .domain(%s)
    .range(%s.concat(d3.schemeCategory10))',
  jsonlite::toJSON(names(fixed_colors), auto_unbox = TRUE),
  jsonlite::toJSON(unname(fixed_colors), auto_unbox = TRUE)
))

customJS <- JS("
  function(el) {
    var nodeColors = {};
    d3.select(el).selectAll('.node').each(function(d) {
      var name = d.name;
      var color = d3.select(this).select('rect').style('fill');
      nodeColors[name] = color;
    });
    d3.select(el).selectAll('.link').each(function(d) {
      var sc = nodeColors[d.source.name] || '#cccccc';
      d3.select(this).style('stroke', sc).style('stroke-opacity', 1.0);
    });
  }
")

sankey <- sankeyNetwork(
  Links = links,
  Nodes = nodes,
  Source = "source",
  Target = "target",
  Value  = "Value",
  NodeID = "name",
  fontSize = 10,
  fontFamily = "Arial",
  nodeWidth = 10,
  nodePadding = 8,
  margin = list(top = 5, right = 100, bottom = 5, left = 120),
  colourScale = colourScale,
  width = 800,
  height = 500
) %>%
  htmlwidgets::prependContent(
    htmltools::tags$style("
      .node text { text-anchor: start !important; transform: translateX(18px); fill: black !important; }
      .link { stroke-opacity: 0.6 !important; }
    ")
  ) %>%
  htmlwidgets::onRender(customJS)

sankey

saveWidget(sankey, file = "sankey_diagram.html", selfcontained = TRUE)

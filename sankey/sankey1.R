require(rCharts)
require(rjson)

links <- matrix(unlist(
  rjson::fromJSON(
    file = "http://bost.ocks.org/mike/sankey/energy.json"
  )$links
),ncol = 3, byrow = TRUE)
nodes <- unlist(
  rjson::fromJSON(
    file = "http://bost.ocks.org/mike/sankey/energy.json"
  )$nodes
)

links <- data.frame(links)
colnames(links) <- c("source", "target", "value")
links$source <- sapply(links$source, FUN = function(x) {return(as.character(nodes[x+1]))}) #x+1 since js starts at 0
links$target <- sapply(links$target, FUN = function(x) {return(nodes[x+1])}) #x+1 since js starts at 0
sankeyPlot <- rCharts$new()
sankeyPlot$setLib('http://timelyportfolio.github.io/rCharts_d3_sankey')
sankeyPlot$set(
  data = links,
  nodeWidth = 15,
  nodePadding = 10,
  layout = 32,
  width = 960,
  height = 500,
  units = "TWh",
  title = "Sankey Diagram"
)
sankeyPlot
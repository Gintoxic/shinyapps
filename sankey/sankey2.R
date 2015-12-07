require(shiny)

runApp(list(
  ui = pageWithSidebar(
    headerPanel('Test'),
    sidebarPanel(  'Test'  ),
    mainPanel(
      chartOutput("Plot", 'C:/R-3.0.1/library/rCharts/libraries/sankey')  
    )
  ),
  server = function(input, output, session){
    
    output$Plot <-  renderChart2({
      sankeyPlot2 <- rCharts$new()
      sankeyPlot2$setLib('C:/R-3.0.1/library/rCharts/libraries/sankey')
      sankeyPlot2$set(
        data = links,
        nodeWidth = 15,
        nodePadding = 10,
        layout = 32,
        width = 960,
        height = 500,
        units = "TWh",
        title = "Sankey Diagram"
      )
      return(sankeyPlot2)
    })
  }
))
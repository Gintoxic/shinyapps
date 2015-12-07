library(shiny)

# Define server logic required to respond to d3 requests
shinyServer(function(input, output) {
  
  # Generate a plot of the requested variable against mpg and only 
  # include outliers if requested
  
#   output$d3io <- reactive(function() {
#     if (is.null(input$d3io)) {
#       0;
#     } else {
#       list(input$xslider);
#     }
#   }
#   
  
  output$d3io <- reactive(
    
    
    
    list(input$xslider,input$yslider, colorRampPalette(c("white",input$cselect))(100)[input$cslider])
      
  
  )
})
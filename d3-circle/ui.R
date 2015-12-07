library(shiny)

d3IO <- function(inputoutputID) {
  div(id=inputoutputID,class=inputoutputID,tag("svg",""));
}

# Define UI for shiny d3 chatter application
shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("D3 Animated Circle"),
  
  sidebarPanel(
   sliderInput("xslider", label=h2("X"), min=1, max=200,value=50,animate=animationOptions(interval=30, loop=T)),
   sliderInput("yslider", label=h2("Y"), min=1, max=200,value=50,animate=animationOptions(interval=30, loop=T)),
   sliderInput("cslider", label=h2("Color"), min=1, max=100,value=50,animate=animationOptions(interval=10, loop=T)),
   selectInput(inputId = "cselect", choices = c("blue","red"),selected = 1,    label="Select Colors")
  ),
  
  mainPanel(
    includeHTML("d3widget.js"),
    d3IO("d3io")
    )
))
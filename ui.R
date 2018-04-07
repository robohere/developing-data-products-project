library(shiny)
library(datasets)

shinyUI(fluidPage(
  
  tabsetPanel(type = "tabs", tabPanel("Main",
  titlePanel("MPG statistics for different variables using Car Dataset"),
  
  # description and input
  sidebarPanel(
    selectInput('x', label='Predictor', selected='cyl', choices=names(mtcars)),
    selectInput('color', label='Color', choices=palette())),

  
  # plot and output
  mainPanel(
    
    h4('Summary of Selected Attribute'),
    h4(verbatimTextOutput("summary")),
    h4(textOutput('text')),
    plotOutput('myPlot'))),
  
  tabPanel("Instructions", htmlOutput("instructions"))
  ))
)
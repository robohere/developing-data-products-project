library(shiny)
library(ggplot2)
data <- mtcars
shinyServer(function(input, output) {
  myXY <- reactive({
    paste("mpg ~", "as.integer(", input$x,")")
  })
  
  myFit <- reactive({
    lm(as.formula(myXY()),data=data)
  })
  
  output$summary <- renderPrint(summary(mtcars[input$x]))
  
  output$instructions <- renderUI({HTML("<li>This project uses mtcars dataset to plot the regression model. <br> 
                                        <li>We are plotting <b>mpg</b> against all other variables. <br>
                                        <li>There are two choices to choose from : input <b>Predictor</b> 
                                        for the plot and the color of the line in the plot. <br>
                                        <li>Just choose these two values and the output will be changed automatically.")})
  
  output$text <- renderText({
    paste("Regression Model:", "mpg ~", input$x)
  })
  
  output$myPlot <- renderPlot ({
    with(data, {plot(as.formula(myXY()),xlab=input$x,ylab="mpg")
      abline(myFit(), col=input$color)
    })
  })
})
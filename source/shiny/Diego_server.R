#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    output$scatter <- renderPlot({

      data <- read.csv("https://raw.githubusercontent.com/info201b-au2022/happiness-levels/main/data/2019_happiness.csv")[ ,c(input$VarX,input$VarY)]
      plot(data[,1],data[,2])

    })

})

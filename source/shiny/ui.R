#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("scatter"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            selectInput(inputId = "VarX",
                  label = "select X-axis Variable:",
                  choices = list("GDP.per.capita", "Score",
                                 "Generosity", "Social.support")), 
            selectInput(inputId = "VarY",
                         label = "select Y-axis Variable:",
                         choices = list("GDP.per.capita", "Score",
                                        "Generosity", "Social.support")), 
        ),

        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("scatter")
        )
    )
))

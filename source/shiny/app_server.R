library(shiny)
library(ggplot2)
library(dplyr)
library(tidyverse)
library(plotly)

happiness <- read.csv("https://raw.githubusercontent.com/info201b-au2022/happiness-levels/main/data/2019_happiness.csv")
countries <- as.list(happiness$Country.or.region)

fig <- plot_ly(x = countries, y=happiness$Score, type = "histogram")
fig

build_scatter <- function(data, selected = "Finland", yvar = "Score") {
  data <- read.csv("https://raw.githubusercontent.com/info201b-au2022/happiness-levels/main/data/2019_happiness.csv")
  data <- data %>% 
    filter(Country.or.region == selected)

  p <- plot_ly(
    x = data[, "Country.or.region"],
    y = data[, yvar], 
    type="histogram", 
    ) %>% 
    layout(
      title = "",
      xaxis = "", 
      yaxis = ""
    )
  return(p)
}


server <- function(input, output) {
  output$scatter <- renderPlotly({
    return(build_histo(happiness, country=input$selected, yvar=input$yvar))
  })
}
library(shiny)
library(ggplot2)
library(dplyr)
library(tidyverse)
library(plotly)
library(maps)
world_shape = map_data("world")

happiness <- read.csv("https://raw.githubusercontent.com/info201b-au2022/happiness-levels/main/data/2019_happiness.csv")

build_barchart <- function(data, yvar = "Score") {
  data <- head(data, 5)
  data <- data %>%
    rename(
      "Happiness Score" = "Score",
      "Social Support" = "Social.support",
      "GDP Per Capita" = "GDP.per.capita",
      "Healthy Life Expectancy" = "Healthy.life.expectancy",
      "Freedom" = "Freedom.to.make.life.choices",
      "Generosity" = "Generosity",
      "Corruption Perception" = "Perceptions.of.corruption",
      "Country" = "Country.or.region"
    )
  p <- plot_ly(
    data = data,
    x = data[, "Country"],
    y = data[, yvar],
    type = "bar"
  ) %>%
    layout(
      title="Bar Plot Analysis of 5 Happiest Countries",
      yaxis=list(title=yvar),
      xaxis=list(title="Country")
    )
    
  return(p)
}

















server <- function(input, output) {
  output$bar <- renderPlotly({
    return(build_barchart(happiness, yvar=input$yvar))
  })
}
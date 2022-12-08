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


buildmap <- function(happiness, analysis_var = "Generosity"){
  world_shape = map_data("world")
  
  happiness[19, "Country.or.region"] <- "USA"
  happiness[15, "Country.or.region"] <- "UK"
  happiness[156, "Country.or.region"] <- "Sudan"
  happiness[127, "Country.or.region"] <- "Democratic Republic of the Congo"
  
  world_happiness <- world_shape %>% 
    rename(Country.or.region = region) %>% 
    left_join(happiness, by = "Country.or.region")
  
  p <- ggplot(world_happiness) +
      geom_polygon(
        mapping = aes(x = long, y = lat, group = group, fill = world_happiness[[analysis_var]]),
        color = "white",
        size = .1
      ) +
      coord_map() +
      scale_fill_continuous(low = "#ff0008", high = "#33ff00")+
      labs(fill = analysis_var,
           x = "Latitude",
           y = "Longitude",
           title = paste("Map of World", analysis_var)
      )
  
  
  return(p)
  
}





server <- function(input, output) {
  output$bar <- renderPlotly({
    return(build_barchart(happiness, yvar=input$yvar))
  })
  output$map <- renderPlot({
    return(buildmap(happiness, analysis_var=input$analysis_var))
  })
}
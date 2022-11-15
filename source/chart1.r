# Chart map for happiness level
library(ggplot2)
library(dplyr)
library(tidyr)

#install.packages("maps")
library(maps)
world_shape = map_data("world")
happiness = read.csv("https://raw.githubusercontent.com/info201b-au2022/happiness-levels/main/data/2019_happiness.csv")

happiness[19, "Country.or.region"] <- "USA"
happiness[15, "Country.or.region"] <- "UK"
happiness[156, "Country.or.region"] <- "Sudan"
happiness[127, "Country.or.region"] <- "Democratic Republic of the Congo"

world_happiness <- world_shape %>% 
  rename(Country.or.region = region) %>% 
  left_join(happiness, by = "Country.or.region")

plots <- ggplot(world_happiness) +
  geom_polygon(
    mapping = aes(x = long, y = lat, group = group, fill = Score),
    color = "white",
    size = .1
  ) +
  coord_map() +
  scale_fill_continuous(low = "#ff0008", high = "#33ff00") +
  labs(fill = "Happiness Score",
       x = "Latitude",
       y = "Longitude",
       title = "Map of World Happiness"
  )

world_happiness_plot <- function() {
  return(plots)
}


  

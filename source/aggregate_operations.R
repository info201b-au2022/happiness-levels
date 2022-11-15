library(ggplot2)
library(dplyr)
library(tidyr)
happiness2019 <- read.csv("https://raw.githubusercontent.com/info201b-au2022/happiness-levels/main/data/2019_happiness.csv")
happiness2018 <- read.csv("https://raw.githubusercontent.com/info201b-au2022/happiness-levels/main/data/2018.csv")

happiness2019['Year'] =  2019
happiness2018['Year'] =  2018
happiness <- rbind(happiness2019, happiness2018)

grouped_averages <- happiness %>%
  select(c(Year, Score, Social.support, Healthy.life.expectancy, Generosity)) %>%
  group_by(Year) %>%
  summarise_all(mean) %>%
  rename(
    'Avg Score' = Score,
    'Avg Social Support' = Social.support,
    'Avg Healthy Life Expectancy' = Healthy.life.expectancy,
    'Avg Generosity' = Generosity
  ) %>%
  mutate_if(is.numeric, round, digits=3)

display_grouped_averages <- function() {
  return(grouped_averages)
}

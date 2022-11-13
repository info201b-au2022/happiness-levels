# Scatter plot for happiness level vs GDP
library(ggplot2)
library(dplyr)
library(tidyr)
happiness = read.csv("https://raw.githubusercontent.com/info201b-au2022/happiness-levels/main/data/2019_happiness.csv")

ggplot(data = happiness) +
  geom_point(mapping = aes(x = GDP.per.capita, y = Score)) +
  geom_smooth(mapping = aes(x = GDP.per.capita, y = Score)) +
  labs(
    x = "GDP per capita",
    y = "Happiness Score",
    title = "Happiness vs GDP per capita"
  )

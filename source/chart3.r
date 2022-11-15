library(ggplot2)
library(dplyr)
library(tidyr)
happiness = read.csv("https://raw.githubusercontent.com/info201b-au2022/happiness-levels/main/data/2019_happiness.csv")

top_ten <- happiness %>% 
  filter(Overall.rank <= 10) %>% 
  arrange(by = Overall.rank)

data2 <- top_ten                                                 # Replicate original data
data2$Country.or.region <- factor(data2$Country.or.region,                                    # Factor levels in increasing order
                  levels = data2$Country.or.region[order(data2$Score)])

topten <- ggplot(data = data2) +
  geom_col(mapping = aes(x = Country.or.region, y = Score)) +
  coord_flip() +
  labs(
    title = "Top Ten Happiest Countries",
    x = "Country",
    y = "Happiness Score"
  )

happiness_top_ten <- function() {
  return(topten)
}

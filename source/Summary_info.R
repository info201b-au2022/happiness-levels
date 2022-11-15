library(ggplot2)
library(dplyr)
library(tidyr)
happiness<- read.csv("https://raw.githubusercontent.com/info201b-au2022/happiness-levels/main/data/2019_happiness.csv")

fertility<- read.csv("https://raw.githubusercontent.com/info201b-au2022/happiness-levels/main/data/Fertility.csv")

median_age<- read.csv("https://raw.githubusercontent.com/info201b-au2022/happiness-levels/main/data/Median%20age.csv")

suicide_rate<- read.csv("https://raw.githubusercontent.com/info201b-au2022/happiness-levels/main/data/Suicide%20rate.csv")

urbanization <- read.csv("https://raw.githubusercontent.com/info201b-au2022/happiness-levels/main/data/Urbanization%20rate.csv")

names(happiness)[names(happiness)=="Country.or.region"] <- "Country"
happiness_merged <- happiness %>% 
   left_join(fertility,by = "Country") %>% 
   left_join(median_age, by ='Country') %>% 
   left_join(suicide_rate, by ='Country') %>% 
   left_join(urbanization,by ='Country') 


info_happiness <- list()
info_happiness$rows <- nrow(happiness)
info_happiness$col <-ncol(happiness)


GDP_happiness_info<- list()
GDP <- happiness$GDP.per.capita
GDP_happiness_info$GDP_median <- median(GDP,na.rm = TRUE)
GDP_happiness_info$GDP_max <- max(GDP,na.rm = TRUE)
GDP_happiness_info$GDP_min <- min(GDP,na.rm = TRUE)



Freedom_happiness_info <- list()
Free <- happiness$Freedom.to.make.life.choices
Freedom_happiness_info$median <- median(Free,na.rm = TRUE)
Freedom_happiness_info$max <- max(Free,na.rm = TRUE)
Freedom_happiness_info$min <- min(Free,na.rm = TRUE)


Health_happiness_info <- list()
Health <- happiness$Healthy.life.expectancy
Health_happiness_info$median <- median(Health,na.rm = TRUE)
Health_happiness_info$max <- max(Health,na.rm = TRUE)
Health_happiness_info$min <- min(Health,na.rm = TRUE)

Suicide_rate_info <- list()
Suicide <- happiness_merged$Suicide.rate
Suicide_rate_info$median<- median(Suicide,na.rm = TRUE)
Suicide_rate_info$max<- max(Suicide,na.rm = TRUE)
Suicide_rate_info$min<- min(Suicide,na.rm = TRUE)


fertility_info <- list()
fert <- happiness_merged$Fertility
fertility_info$median <- median(fert,na.rm = TRUE)
fertility_info$max <- max(fert,na.rm = TRUE)
fertility_info$min<- min(fert,na.rm = TRUE)


age_info <- list()
age <- happiness_merged$Median.age
age_info$median <- median(age,na.rm = TRUE)
age_info$max <- max(age,na.rm = TRUE)
age_info$min <- min(age,na.rm = TRUE)


urban_info <- list()
urban <- happiness_merged$Urbanization.rate
urban_info$median <- median(urban,na.rm = TRUE)
urban_info$max <- max(urban,na.rm = TRUE)
urban_info$min <- min(urban,na.rm = TRUE)

get_summaries <- function() {
  return(list(info_happiness, GDP_happiness_info, Freedom_happiness_info, Health_happiness_info, Suicide_rate_info, fertility_info, age_info, urban_info))
}

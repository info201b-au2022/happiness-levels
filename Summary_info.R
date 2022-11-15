
library(dplyr)
happiness<- read_csv("https://raw.githubusercontent.com/info201b-au2022/happiness-levels/main/data/2019_happiness.csv")

fertility<- read_csv("https://raw.githubusercontent.com/info201b-au2022/happiness-levels/main/data/Fertility.csv")

median_age<- read_csv("https://raw.githubusercontent.com/info201b-au2022/happiness-levels/main/data/Median%20age.csv")

suicide_rate<- read_csv("https://raw.githubusercontent.com/info201b-au2022/happiness-levels/main/data/Suicide%20rate.csv")

urbanization <- read_csv("https://raw.githubusercontent.com/info201b-au2022/happiness-levels/main/data/Urbanization%20rate.csv")

names(happiness)[names(happiness)=="Country or region"] <- "Country"
happiness_merged <- happiness %>% 
   left_join(fertility,by = "Country") %>% 
   left_join(median_age, by ='Country') %>% 
   left_join(suicide_rate, by ='Country') %>% 
   left_join(urbanization,by ='Country') 


info_happiness <- list()
info_happiness$rows <- nrow(happiness)
info_happiness$col <-ncol(happiness)


GDP_happiness_info<- list()
GDP <- happiness$`GDP per capita`
GDP_happiness_info$GDP_median <- median(GDP,na.rm = T)
GDP_happiness_info$GDP_max <- max(GDP,na.rm = T)
GDP_happiness_info$GDP_min <- min(GDP,na.rm = T)



Freedom_happiness_info <- list()
Free <- happiness$`Freedom to make life choices`
Freedom_happiness_info$median <- median(Free,na.rm = T)
Freedom_happiness_info$max <- max(Free,na.rm = T)
Freedom_happiness_info$min <- min(Free,na.rm = T)


Health_happiness_info <- list()
Health <- happiness$`Healthy life expectancy`
Health_happiness_info$median <- median(Health,na.rm = T)
Health_happiness_info$max <- max(Health,na.rm = T)
Health_happiness_info$min <- min(Health,na.rm = T)

Suicide_rate_info <- list()
Suicide <- happiness_merged$`Suicide rate`
Suicide_rate_info$median<- median(Suicide,na.rm = T)
Suicide_rate_info$max<- max(Suicide,na.rm = T)
Suicide_rate_info$min<- min(Suicide,na.rm = T)


fertility_rate_info <- list()
fert <- happiness_merged$Fertility
fertility_rate_info$median <- median(fert,na.rm = T)
fertility_rate_info$max <- max(fert,na.rm = T)
fertility_rate_info$min<- min(fert,na.rm = T)


median_age_info <- list()
median <- happiness_merged$`Median age`
median_age_info$median <- median(fert,na.rm = T)
median_age_info$max <- max(fert,na.rm = T)
median_age_info$min <- min(fert,na.rm = T)


urbanization_info <- list()
urban <- happiness_merged$`Urbanization rate`
median_age_info$median <- median(urban,na.rm = T)
median_age_info$max <- max(urban,na.rm = T)
median_age_info$min <- min(urban,na.rm = T)

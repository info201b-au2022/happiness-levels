library(plotly)
library(shiny)

# intro
happiness <- read.csv("https://raw.githubusercontent.com/info201b-au2022/happiness-levels/main/data/2019_happiness.csv")
countries <- as.list(happiness$Country.or.region)

intro_main_content <- mainPanel(
  h1("Introduction"),
  p(" Individual moods and conduct are significantly impacted by happiness. 
  Even more crucial is knowing what influences our happiness. We looked 
  at this issue from a wider perspective in an effort to comprehend this 
  query. Our analysis will center on the Gallup World Poll 2019 Report and 
  the associated factors. In order to identify the elements that are most 
  strongly associated with happiness, this initiative evaluated variables 
  like health, economic conditions, and freedom. We consider this subject 
  to be significant due to its connection to mental health. For this reason, 
  we're looking for a correlation between the data's variables and the 
  happiness index. By analyzing patterns, outliers, and elements like geography,
  we seek to better comprehend and illustrate what makes us happy."),
  
  
  h2("Problem Domain"),
  h3("Project Framing"),
  p("This project is operating within the many boundaries of human experience. Happiness is a concept that many philosophers spend their lives trying to define, but happiness is difficult to quantify. This project takes into account factors such as health, economic conditions, and freedom to determine which factors correlate most with happiness. This is a project that can apply to any human because we all seek to achieve happiness in one form or another. This project is also limited in terms of individual experience. For example, a country's GDP per capita could be quite high, but this number could be misrepresentative due to the unequal allocations of wealth in certain countries, like the United States.
"),
  h3("Human values"),
  p("The human value that is at the forefront of this project is happiness. But the factors that we will investigate in relation to happiness can be defined through human values as well. Health can be defined as the value of self-discipline because one must be disciplined enough to take care of their own body. Health can also be linked to love and compassion because if you are unable to take care of yourself for whatever reason, those who love you will show compassion in helping you stay healthy. The World Health Organization indicates that all of these values play an integral role in health. Economic prosperity is difficult to assign a value because many factors contribute to it. On an individual level, it can be linked to your perseverance, concentration, and creativity. On a communal level, economic prosperity and freedom can be linked to global stewardship and cooperation. A study in the Chinese journal of Sociology found that a country's political relationships can have a significant impact on wealth. Attached is a figure laying out these human values, classifying them under different terms.
"),
  h3("Direct and Indirect Stakeholders"),
  p("The direct stakeholders in this project include us as the data analysts, the INFO 201 class as viewers of this project, and Professor Hendry. The indirect stakeholders include those who will not use this project, but might be affected by it. For example, if a policy maker were to make a legislative decision based on this project to make their community more happy, those impacted by that legislation would be indirect stakeholders.
"),
  h3("Possbile Harms"),
  p("Possible harms of this project include misinterpretation of the data. Hypothetically, if the data determined that the happiness countries are all in the Middle East, one might interpret that to mean that the cultures of the Middle East are better at inducing happiness than others. This might lead them to make decisions to replicate Middle Eastern countries cultures, even if the culture isn't necessarily related to the happiness of the countries.
"),
  h3("Possible Benefits"),
  p("The possible benefits of this project is to serve as a general guide on what factors are most conducive to happiness! By learning what factors contribute most to happiness, we could learn how to orient our lives to pursue the highest happiness. For example, if it turns out that health is a larger determinant of happiness than wealth, some might decide to spend more time exercising and less time at work.
"),
  
  h2("Research Questions"),
  h3("What are the top 5 happiest countries?"),
  p("We want to find the happiest countries to find important factors that are tied with countries with a high happiness index. This is important because if we see that most of the countries have strong culture (for example), that could be a potential factor to explore later. 
"),
  h3("What is the relationship between health and happiness?"),
  p("We want to find a relationship between health and happiness to help explain a country's happiness score. If we can see that countries with large access to health care tend to be happier, areas with low happiness scores could be depleted of health resources, money, etc, which isn't right. 
"),
  h3("What is the relationship between a national economy and national happiness score?"),
  p("We want to find the relationship between national economic success and happiness. This is an interesting question because the value of money vs. happiness is constantly debated. We are interested in seeing if there is any type of relationship between these two variables."),
  h3("What is the relationship between freedom and happiness?"),
  p("While we expect this relationship to be pretty positive, this is a good question to confirm the validity of our dataset, and therefore our other research questions. Confirming a relationship between these two variables will help give us concrete observations."),
  h2("Our Dataset"),
  p("In this project, we have included seven variables. To gain a better 
  understanding of what determines and affects happiness, we chose freedom, 
  health, suicide rates, urbanization, fertility rates, GDP, and age. We 
  included three interactive charts in this project to teach our users about 
  how the variables we chose affect happiness globally."),
  h2("Key Findings"),
  p("The five happiest countries turned out to be Denmark, Finland, Iceland, Netherlands, and Norway. 
  All of these countries, except the Netherlands, are considered Nordic countries, with some shared cultural characteristics. 
  These countries had similar levels of social support, GDP per capita, healthy life expectancy, and freedom. 
  However, the countries' scores of generosity and corruption perception varied greatly! 
  Looking at generosity differences, Finland scored the lowest at 0.15, while the next lowest score was Denmark at 0.25 and the highest score was Iceland at 0.35. 
  This indicates that generosity among the happiest countries does not affect happiness as much as the other factors. 
  Interestingly, while Iceland scored the highest in generosity among the five happiest countries, it scored the lowest in corruption perception. 
  However, the rest of the five happiest countries had very high corruption perception scores. 
  This implies that less corruption generally leads to more happiness, especially in the five happiest countries.
"),
  p("There was a strong correlation between healthy life expectancy and happiness. The trend showed that as healthy life expectancy increased, so did happiness. The country with the highest life expectancy, Singapore, did not have the highest happiness score, but the country ranked within the top 40 in happiness. The happiest country, Finland, did not have the highest life expectancy but ranked within the top 25 for life expectancy. This trend makes sense, considering healthy people tend to be happier, and being sick and living less tends to make people sad.
"),
  p("There was a strong correlation between happiness and GDP per capita. 
  The trend showed that as GDP per capita increased, so did happiness. 
  The country with the highest GDP per capita, Qatar, did not have the highest happiness score, but the country ranked within the top 30 in happiness. 
  The happiest country, Finland, did not have the highest GDP per capita but ranked within the top 25 for GDP per capita. 
  This trend shows that the saying 'Money can't buy happiness' is not necessarily true, as richer countries are happier overall.
"),
  p("There was a small correlation between happiness and freedom. The trend showed that as freedom increased, so did happiness, but not by as much as factors like GDP or life expectancy. The country with the highest level of freedom, Uzbekistan, did not have the highest happiness score but ranked within the top 40 in happiness. The happiest country, Finland, did not have the highest freedom score but was actually the fifth most free! While this trend was weaker than the others mentioned in previous research questions, freedom still had a positive impact on happiness.
")
)

intro_panel <- tabPanel(
  "Home",
  titlePanel("Home"),
  intro_main_content
)
# chart 1


list(
  "Happiness Score",
  "Social Support",
  "GDP Per Capita",
  "Healthy Life Expectancy",
  "Freedom",
  "Generosity",
  "Corruption Perception"
)

chart1_sidebar_content <- sidebarPanel(
    selectInput(inputId = "VarX",
                label = "select X-axis Variable:",
                choices = list(
                  "Happiness Score",
                  "Social Support",
                  "GDP Per Capita",
                  "Healthy Life Expectancy",
                  "Freedom",
                  "Generosity",
                  "Corruption Perception")
                ),
                
    selectInput(inputId = "VarY",
                label = "select Y-axis Variable:",
                choices = list(
                  "Happiness Score",
                  "Social Support",
                  "GDP Per Capita",
                  "Healthy Life Expectancy",
                  "Freedom",
                  "Generosity",
                  "Corruption Perception")
    )
)

chart1_main_content <- mainPanel(
  plotlyOutput("scatter"),
  p("Caption: The purpose of this scatterplot is to analyze the correlation between different factors. If the dots trend in one direction, the factors may be related. If not, they are likely not correlated. This chart's primary purpose to to analyze how different factors affect happiness, but it can also be used to analyze other correlations, like GDP per capita vs generosity.")
)

chart1_panel <- tabPanel(
  "Chart 1",
  titlePanel("Scatterplot Correlation Analysis of All Happiness Factors"),
  chart1_sidebar_content,
  chart1_main_content
)

# chart 2

chart2_sidebar_content <- sidebarPanel(
  selectInput(
    inputId = "analysis_var",
    label = "Level of Analysis",
    choices = list(
      "Social Support" = "Social.support",
      "GDP Per Capita" = "GDP.per.capita",
      "Healthy Life Expectancy" = "Healthy.life.expectancy",
      "Generosity" = "Generosity"
    )
  )
)

chart2_main_content <- mainPanel(
    plotOutput(outputId = "map"),
    p("Caption: This purpose of this map chart is to see where countries differ in terms of different variables that affect happiness. This map allows us to see where certain variables are most or less prevelant, if trends are similar or differ wildly from country to neighboring country.")
)

chart2_panel <- tabPanel(
  "Chart 2",
  titlePanel("Geographic Analysis of Happiness Factors "),
  chart2_sidebar_content,
  chart2_main_content
)

# chart 3

chart3_sidebar_content <- sidebarPanel(
  selectInput(
    "yvar",
    label = "Select a Variable",
    choices = list(
      "Happiness Score" = "Happiness Score",
      "Social Support" = "Social Support",
      "GDP Per Capita" = "GDP Per Capita",
      "Healthy Life Expectancy" = "Healthy Life Expectancy",
      "Freedom" = "Freedom",
      "Generosity" = "Generosity",
      "Corruption Perception" = "Corruption Perception"
    ),
    selected = "Happiness Score"
  )
)

chart3_main_content <- mainPanel(
  plotlyOutput("bar"),
  p("Caption: The purpose of this bar chart is to analyze how different features of the dataset are prevelant in the 5 happiest countries. This chart allows us to see what factors are common among the happiest countries.")
)

chart3_panel <- tabPanel(
  "Chart 3",
  titlePanel("Bar Plots on Top Five Happiest Countries"),
  chart3_sidebar_content,
  chart3_main_content
)

# summary

summary_main_content <- mainPanel()

summary_panel <- tabPanel(
  "Summary",
  titlePanel("My summary takeaways"),
  summary_main_content
)

# report

report_main_content <- mainPanel(
  h1("What Does it Mean to Be Happy?"),
  h3("Code Name"),
  p("happiness-levels"),
  h3("Authors"),
  p("Kunal Srivastava (kunalsr@uw.edu)
    Drew Blik (drewblik@uw.edu)
    Diego Felgueres (diegof20@uw.edu)
    Samiira Yusuf  (sy12345@uw.edu)"),
  h3("Affiliation"),
  p("INFO-201: Technical Foundations of Informatics - The Information School - University of Washington
"),
  p("December 8th, 2022"),
  h3("Abstract"),
  p("Our main goal is to assess levels of happiness across the globe as they relate/overlap with relevant metrics like GDP, fertility and life expectancy. To address these questions, we plan to analyze the 2019 World Happiness Report for relationships between several variables to create data visualizations and representations and help explain happiness across the globe.
"),
  h3("Keywords"),
  p("Mental health, happiness, mood"),
  h3("Introduction"),
  p("Individual moods and conduct are significantly impacted by happiness. Even more crucial is knowing what influences our happiness. We looked at this issue from a wider perspective in an effort to comprehend this query. Our analysis will center on the Gallup World Poll 2019 Report and the associated factors. In order to identify the elements that are most strongly associated with happiness, this initiative evaluated variables like health, economic conditions, and freedom. We consider this subject to be significant due to its connection to mental health. For this reason, we're looking for a correlation between the data's variables and the happiness index. By analyzing patterns, outliers, and elements like geography, we seek to better comprehend and illustrate what makes us happy."),
  h2("Problem Domain"),
  h3("Project Framing"),
  p("This project is operating within the many boundaries of human experience. Happiness is a concept that many philosophers spend their lives trying to define, but happiness is difficult to quantify. This project takes into account factors such as health, economic conditions, and freedom to determine which factors correlate most with happiness. This is a project that can apply to any human because we all seek to achieve happiness in one form or another. This project is also limited in terms of individual experience. For example, a country's GDP per capita could be quite high, but this number could be misrepresentative due to the unequal allocations of wealth in certain countries, like the United States."),
  h3("Human values"),
  p("The human value that is at the forefront of this project is happiness. But the factors that we will investigate in relation to happiness can be defined through human values as well. Health can be defined as the value of self-discipline because one must be disciplined enough to take care of their own body. Health can also be linked to love and compassion because if you are unable to take care of yourself for whatever reason, those who love you will show compassion in helping you stay healthy. The World Health Organization indicates that all of these values play an integral role in health. Economic prosperity is difficult to assign a value because many factors contribute to it. On an individual level, it can be linked to your perseverance, concentration, and creativity. On a communal level, economic prosperity and freedom can be linked to global stewardship and cooperation. A study in the Chinese journal of Sociology found that a country's political relationships can have a significant impact on wealth. Attached is a figure laying out these human values, classifying them under different terms."),
  h3("Direct and Indirect Stakeholders"),
  p("The direct stakeholders in this project include us as the data analysts, the INFO 201 class as viewers of this project, and Professor Hendry. The indirect stakeholders include those who will not use this project, but might be affected by it. For example, if a policy maker were to make a legislative decision based on this project to make their community more happy, those impacted by that legislation would be indirect stakeholders."),
  h3("Possbile Harms"),
  p("Possible harms of this project include misinterpretation of the data. Hypothetically, if the data determined that the happiness countries are all in the Middle East, one might interpret that to mean that the cultures of the Middle East are better at inducing happiness than others. This might lead them to make decisions to replicate Middle Eastern countries cultures, even if the culture isn't necessarily related to the happiness of the countries."),
  h3("Possible Benefits"),
  p("The possible benefits of this project is to serve as a general guide on what factors are most conducive to happiness! By learning what factors contribute most to happiness, we could learn how to orient our lives to pursue the highest happiness. For example, if it turns out that health is a larger determinant of happiness than wealth, some might decide to spend more time exercising and less time at work."),
  
  h2("Research Questions"),
  h3("What are the top 5 happiest countries?"),
  p("We want to find the happiest countries to find important factors that are tied with countries with a high happiness index. This is important because if we see that most of the countries have strong culture (for example), that could be a potential factor to explore later. "),
  h3("What is the relationship between health and happiness?"),
  p("We want to find a relationship between health and happiness to help explain a country's happiness score. If we can see that countries with large access to health care tend to be happier, areas with low happiness scores could be depleted of health resources, money, etc, which isn't right. "),
  h3("What is the relationship between a national economy and national happiness score?"),
  p("We want to find the relationship between national economic success and happiness. This is an interesting question because the value of money vs. happiness is constantly debated. We are interested in seeing if there is any type of relationship between these two variables."),
  h3("What is the relationship between freedom and happiness?"),
  p("While we expect this relationship to be pretty positive, this is a good question to confirm the validity of our dataset, and therefore our other research questions. Confirming a relationship between these two variables will help give us concrete observations."),
  
  h3("The Dataset"),
  p("The World Happiness Report is a landmark survey of the state of global happiness. This data was collected in 2019 for the purpose of researching global happiness and 6 factors contributing to happiness. The variables in this data don’t affect the the total score reported for each country, but they do explain why some countries rank higher than others. For this project we are measuring happiness and picked four variables out of  six, which include health, country, economy and freedom and how they relate to happiness. According to the website we are retrieving data from; the happiness scores and rankings use data from the Gallup World Poll. The scores are based on answers to the main life evaluation question asked in the poll. This question, known as the Cantril ladder, asks respondents to think of a ladder with the best possible life for them being a 10 and the worst possible life being a 0 and to rate their own current lives on that scale. The scores are from representative samples. Using the data from the figure below we will be able to make conclusions about the relationship between variables and how these variables affect the overall score of happiness. Furthermore, with the 4 factors we selected: health, country, economy, and freedom, we are able to measure how they correlate with the level of happiness using a scatter plot, to observe and visually display the relationship between variables. With the data we are provided we are also  given a benchmark with our variables as to how low they can perform. Dystopia as an imaginary country that has the world’s least-happy people. The purpose in establishing Dystopia is to have a benchmark against countries that can be favorably compared to a country that cannot be performed lower than, in terms of each of the six key variables. Lastly the data we selected has several benefits that include  allowing  governments, organizations, and healthcare metrics and evaluators to inform their policy-making decisions around factors that can contribute to happiness. Data evaluations can be used as an important resource as a measurement of well-being that can be used to effectively assess the progress of nations. We plan to use both the 2018 and 2019, and add a world data dataset for more information"),
  h3("Findings"),
  p("The five happiest countries turned out to be Denmark, Finland, Iceland, Netherlands, and Norway. 
  All of these countries, except the Netherlands, are considered Nordic countries, with some shared cultural characteristics. 
  These countries had similar levels of social support, GDP per capita, healthy life expectancy, and freedom. 
  However, the countries' scores of generosity and corruption perception varied greatly! 
  Looking at generosity differences, Finland scored the lowest at 0.15, while the next lowest score was Denmark at 0.25 and the highest score was Iceland at 0.35. 
  This indicates that generosity among the happiest countries does not affect happiness as much as the other factors. 
  Interestingly, while Iceland scored the highest in generosity among the five happiest countries, it scored the lowest in corruption perception. 
  However, the rest of the five happiest countries had very high corruption perception scores. 
  This implies that less corruption generally leads to more happiness, especially in the five happiest countries."),
  p("There was a strong correlation between healthy life expectancy and happiness. The trend showed that as healthy life expectancy increased, so did happiness. The country with the highest life expectancy, Singapore, did not have the highest happiness score, but the country ranked within the top 40 in happiness. The happiest country, Finland, did not have the highest life expectancy but ranked within the top 25 for life expectancy. This trend makes sense, considering healthy people tend to be happier, and being sick and living less tends to make people sad."),
  p("There was a strong correlation between happiness and GDP per capita. 
  The trend showed that as GDP per capita increased, so did happiness. 
  The country with the highest GDP per capita, Qatar, did not have the highest happiness score, but the country ranked within the top 30 in happiness. 
  The happiest country, Finland, did not have the highest GDP per capita but ranked within the top 25 for GDP per capita. 
  This trend shows that the saying 'Money can't buy happiness' is not necessarily true, as richer countries are happier overall."),
  p("There was a small correlation between happiness and freedom. The trend showed that as freedom increased, so did happiness, but not by as much as factors like GDP or life expectancy. The country with the highest level of freedom, Uzbekistan, did not have the highest happiness score but ranked within the top 40 in happiness. The happiest country, Finland, did not have the highest freedom score but was actually the fifth most free! While this trend was weaker than the others mentioned in previous research questions, freedom still had a positive impact on happiness."),
  h3("Discussion"),
  p("This project aims to investigate the factors that influence happiness in human beings. By studying various aspects of human behavior, we aim to determine which factors are most closely related to happiness. Through our analysis of the data, we have discovered a couple of key factors that have a significant impact on happiness levels across countries. One of the most significant factors we identified is GDP. Although it is commonly said that money can't buy happiness, our data showed that living in a country with a higher GDP can have a positive impact on happiness levels. This is likely because having more resources, goods, and services available can make life more enjoyable and alleviate some of the stressors that people face. However, we also found that other factors, such as levels of corruption and freedom, had a significantly less impact on the trends of happiness we observed in different countries. This suggests that while these factors may play a role in happiness, they are not as significant as some other factors. Overall, our data showed that all of the variables we studied are strongly correlated with happiness, as well as with each other. This information can be used to inform policies and improve living conditions in order to promote mental well-being for citizens around the world."),
  h3("Conclusion"),
  p("Through the course of the analysis, we experimented with trying to discover relationships between countries and their happiness metrics. For example, we found it very interesting that the top five happiest countries all share very similar levels of social support, GDP per capita, life expectancy, and freedom. However, they had largely differing differences when compared by generosity or corruption perception. Our geospatial visualization allowed us to visualize hotspots of high ratings on a map of the world, which gave us the ability to visualize high-intensity areas in stronger colors, like a heatmap. Finally the scatterplot gave the reader an insight into the correlations and relationships between variables. We found this visualization the most revealing because of the nature of the correlations between two variables—most had positive, very direct relationships as they related to happiness. However, in our analysis, it was important for us to remember that correlation and causation are not the same. That is, even if there is a positive, direct, relationship between happiness and GDP per capita, happiness cannot be explained by the GDP per capita, as there are many unknown factors into the overall happiness score. We would need to run experimentation to try to isolate variables in the future, and experiment on them to look for an increase in happiness. Looking back, we think we could have done a better job cleaning the data in the preprocessing stage. When creating the interactive plots for each chart, we had to clean it for each case, rather than preprocess the data to a new spreadsheet file and use that instead. In conclusion, we did a solid analysis of the World Happiness Data, diving deeper than surface level into the data to look for hidden relationships."),
  h3("References"),
  p("“World Happiness Report.” Www.kaggle.com, www.kaggle.com/datasets/unsdsn/world-happiness?resource=download&select=2019.csv."),
  p("World Health Organization. “Determinants of Health.” Www.who.int, World Health Organisation, 3 Feb. 2017, www.who.int/news-room/questions-and-answers/item/determinants-of-health."),
  p("“U.S. Net Worth Statistics: The State of Wealth in 2022.” FinanceBuzz, 18 Aug. 2021, www.financebuzz.com/us-net-worth-statistics."),
  h3("Acknowledgements"),
  p("Thanks to our TA Sam and the 201 teaching staff."),
)

report_panel <- tabPanel(
  "Report",
  titlePanel("Report"),
  report_main_content
)


ui <- fluidPage(
  navbarPage("Happiness Levels Analysis", 
             intro_panel, 
             chart1_panel, 
             chart2_panel,
             chart3_panel, 
             summary_panel, 
             report_panel)
)



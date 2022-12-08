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
  
  h1("Our Dataset"),
  
  p("In this project, we have included seven variables. To gain a better 
  understanding of what determines and affects happiness, we chose freedom, 
  health, suicide rates, urbanization, fertility rates, GDP, and age. We 
  included three interactive charts in this project to teach our users about 
  how the variables we chose affect happiness globally.")
)

intro_panel <- tabPanel(
   "Home",
   
titlePanel("Home"),
  
intro_main_content

)
# chart 1

chart1_sidebar_content <- sidebarPanel(
  
    selectInput(inputId = "VarX",
                label = "select X-axis Variable:",
                choices = list("GDP.per.capita", "Score",
                               "Generosity", "Social.support")), 
    selectInput(inputId = "VarY",
                label = "select Y-axis Variable:",
                choices = list("GDP.per.capita", "Score",
                               "Generosity", "Social.support")), 
  
)

chart1_main_content <- mainPanel(
  plotOutput("scatter"),
  p("Caption: The purpose of this scatterplot is to analyze the correlation between different factors. If the dots trend in one direction, the factors may be related. If not, they are likely not correlated. This chart's primary purpose to to analyze how different factors affect happiness, but it can also be used to analyze other correlations, like GDP per capita vs generosity.")
)

chart1_panel <- tabPanel(
  "Chart 1",
  
  titlePanel("My Page 1"),
  
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
  titlePanel("My Page 2"),
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

report_main_content <- mainPanel()

report_panel <- tabPanel(
  "Report",
  
  titlePanel("My report"),
  
  summary_main_content
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



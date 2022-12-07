# intro
happiness <- read.csv("https://raw.githubusercontent.com/info201b-au2022/happiness-levels/main/data/2019_happiness.csv")
countries <- as.list(happiness$Country.or.region)

intro_main_content <- mainPanel()

intro_panel <- tabPanel(
  "Introduction",
  
  titlePanel("Introduction"),
  
  intro_main_content
)

# chart 1

chart1_sidebar_content <- sidebarPanel(
  
)

chart1_main_content <- mainPanel(
  
)

chart1_panel <- tabPanel(
  "Chart 1",
  
  titlePanel("My Page 1"),
  
  chart1_sidebar_content,
  
  chart1_main_content
)

# chart 2

chart2_sidebar_content <- sidebarPanel()

chart2_main_content <- mainPanel()

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
  p("Caption: ")
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
   theme = shinytheme("cerulean"),
  navbarPage("Happiness Levels Analysis", 
             intro_panel, 
             chart1_panel, 
             chart2_panel,
             chart3_panel, 
             summary_panel, 
             report_panel)
)



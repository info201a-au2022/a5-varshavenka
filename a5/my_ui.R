  library(shiny)
  library(dplyr)
  install.packages("plotly")
  library(plotly)
  co2_data <- read.csv("https://raw.githubusercontent.com/owid/co2-data/master/owid-co2-data.csv")
  View(co2_data)
ui <- fluidPage(
  titlePanel("CO2 Per Capita Data"),
  mainPanel(
    h2("Introduction"),
    p("Through this Shiny application, I will be looking at CO2 per capita data. Using the data set, I found that CO2 per capita was highest in the country of 'where_highest.r'. I also found that CO2 per capita was highest in the year 'highest.globally.r'. Additionaly, the average CO2 per capita was found to be 'avgco2.r'."),

  navbarPage("CO2 Per Capita",
             tabPanel("Interactive Chart"),
  ),
      data = co2_data,

  titlePanel(title = h4("CO2 Per Capita by Year", align="center")),
  sidebarPanel(
    
    radioButtons("year", "Select Year",
                 choices = c(co2_data$year),
                 selected = "year")),
  

  mainPanel(
    plotOutput("bar", height = )),
  p("This bar graph shows the CO2 Per Capita by Year")
  )
  
)


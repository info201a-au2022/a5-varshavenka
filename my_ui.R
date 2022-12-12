# Define UI for application that draws a histogram
ui <- fluidPage(
  titlePanel("CO2 Per Capita Data"),
  mainPanel(
    h2("Introduction"),
    p("Through this Shiny application, I will be looking at CO2 per capita data. Using the data set, I found that CO2 per capita was highest in the country of 'where_highest.r'. I also found that CO2 per capita was highest in the year 'highest.globally.r'. Additionaly, the average CO2 per capita was found to be 'avgco2.r'."),
  )
)
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      sliderInput("bins",
                  "Number of bins:",
                  min = 1,
                  max = 50,
                  value = 30)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot")
    )
  )
)
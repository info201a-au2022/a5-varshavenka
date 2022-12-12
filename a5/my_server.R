server <- function(input,output){
library(shiny)
library(dplyr)
install.packages("plotly")
library(plotly)
co2_data <- read.csv("https://raw.githubusercontent.com/owid/co2-data/master/owid-co2-data.csv")
View(co2_data)

#Where co2_per_capita is highest
where_highest <- function(){
  co2_data %>%
    filter(co2_per_capita == max(co2_per_capita, na.rm = TRUE)) %>%
    pull(country)
}

where_highest()



#What is the average co2_per_capita across all years
avg_co2 <- function(){
  avgco2 <- co2_data %>%
    summarize(avgco2 = mean(co2_per_capita, na.rm = TRUE)) %>%
    pull(avgco2)
  
  return(avgco2)
}

avg_co2()

#What year was co2_per_capita highest globally

highest_globally <- function(){
  high <- co2_data %>%
    filter(co2_per_capita == max(co2_per_capita, na.rm = TRUE)) %>%
    pull(year)
  return (high)
}


highest_globally()

reactive_data = reactive({
  selected_year = as.numeric(co2_data$year)
  return(co2_data[co2_data$year==selected_year,])
  
})

output$bar <- renderPlot({
  
  color <- c("green", "blue")
  
  our_data <- reactive_data()
  
  barplot(colSums(our_data[,c("CO2 Per Capita","Year")]),
          ylab="CO2 Per Capita",
          xlab="Year",
          names.arg = c("CO2 Per Capita", "Year"),
          col = color)
})
}



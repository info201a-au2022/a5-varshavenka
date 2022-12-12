#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/


library(shiny)
library(dplyr)
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



# Run the application 
shinyApp(ui = ui, server = server)

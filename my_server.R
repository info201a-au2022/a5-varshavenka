server <- function(input,output){
  
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



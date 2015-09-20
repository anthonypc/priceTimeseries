library(shiny)
library(ggplot2)
library(dplyr)
library(markdown)

flightSet <- read.csv("http://www.linkstomystuff.com/files/201509-price.csv?dl=1", header = TRUE, sep=",", quote="\"", col.names = c("url","head_line","ad_copy","query","date","price01","price02","brand","price","price_log"), row.names = NULL)
flightSet$date <- as.Date(flightSet$date)

function(input, output){

  dataset <- reactive({
    mindate <- input$date[1]
    maxdate <- input$date[2]
    minprice <- input$price[1]
    maxprice <- input$price[2]
    
    f <- flightSet %>%
      filter(
        date >= mindate,
        date <= maxdate,
        price >= minprice,
        price <= maxprice
      ) %>%
      arrange(price)
    
    if (input$brand != "All") {
      f <- f %>% filter(brand == input$brand)
    }
    
    if (input$query != "All") {
      f <- f %>% filter(query == input$query)
    }
    
    })

  output$plot <- renderPlot({
    withProgress(message = 'Calculation in progress',
                 detail = 'This may take a while...', value = 0, {
                   for (i in 1:15) {
                     incProgress(1/15)
                     Sys.sleep(0.25)
                   }
                 })
    p <- ggplot(dataset(), aes(x = date, y = price, colour = brand)) + geom_point() + theme(axis.text.x = element_text(angle = 30, hjust = 1))
    
    print(p)
    
  }, height=700)
  
  output$plotDist <- renderPlot({
    withProgress(message = 'Calculation in progress',
                 detail = 'This may take a while...', value = 0, {
                   for (i in 1:15) {
                     incProgress(1/15)
                     Sys.sleep(0.25)
                   }
                 })
    p <- ggplot(dataset(), aes(x = price, fill = brand)) + geom_density(alpha = .3)
    
    print(p)
    
  }, height=700)

  output$plotBox <- renderPlot({
    withProgress(message = 'Calculation in progress',
                 detail = 'This may take a while...', value = 0, {
                   for (i in 1:15) {
                     incProgress(1/15)
                     Sys.sleep(0.25)
                   }
                 })
    p <- ggplot(dataset(), aes(x = date, y = price)) + geom_boxplot(aes(group = date)) + theme(axis.text.x = element_text(angle = 30, hjust = 1))
    
    print(p)
    
  }, height=700)

  output$summary <- renderPrint({
    data.frame(aggregate(price ~ brand, dataset(), summary))
  })
  
  
}

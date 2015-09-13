library(shiny)
library(ggplot2)

function(input, output) {
  dataset <- na.omit(read.csv("https://www.dropbox.com/s/9dw6hanf0ce6x9l/201509-price.csv?dl=1", header = TRUE, sep=",", quote="\"", col.names = c("url","head_line","ad_copy","query","date","price01","price02","brand","price","price_log"), row.names = NULL))

  output$plot <- renderPlot({
    
    p <- ggplot(dataset, aes(x = date, y = price, colour = brand)) + geom_point()
    
    print(p)
    
  }, height=700)
  
}

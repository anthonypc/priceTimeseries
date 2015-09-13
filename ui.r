library(shiny)
library(ggplot2)

dataset <- diamonds

fluidPage(
  
  titlePanel("Diamonds Explorer"),
  
  sidebarPanel( 
    selectInput('color', 'Color', c('None', dataset$brand)),
  ),
  
  mainPanel(
    plotOutput('plot')
  )
)
library(shiny)
library(ggplot2)
library(dplyr)

dataset <- na.omit(read.csv("https://www.dropbox.com/s/9dw6hanf0ce6x9l/201509-price.csv?dl=1", header = TRUE, sep=",", quote="\"", col.names = c("url","head_line","ad_copy","query","date","price01","price02","brand","price","price_log"), row.names = NULL))
dataset$date <- as.Date(dataset$date)

fluidPage(
  titlePanel("Advertised Flight Prices"),
  
  sidebarPanel(
    dateRangeInput("date", "Date range:",
                   start = "2014-03-10",
                   end   = "2015-09-11"),

    selectInput("query", "The query the ad showed for.",
                levels(unique(dataset$query))
    ),
    
    selectInput("brand", "The brand displayed in the ad's URL.",
                c("All",levels(unique(dataset$brand)))
    )
    ),
  
  mainPanel(
    tabsetPanel(
    tabPanel("Time Series Plot", plotOutput("plot")),
    tabPanel("Distribution Plot", plotOutput("plotDist"))
    
    )
  )
)
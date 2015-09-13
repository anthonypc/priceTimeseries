# priceTimeseries
Shiny visualisation project based on search ad price data.

## Data
Briefly the data being used here was put together from some PHP and a MySQL database. It ran through a list of search terms, and collected the search result page to be archived and extracted the ads using xpath to be stored in the database. Archiving the pages as html turned out to be a good idea, as Google did change their mark up a few times over the course of teh last year, and some data had to be extracted after the fact. The code used for this has not been included.

## References
The code was based on parts of http://shiny.rstudio.com/gallery/movie-explorer.html for a number of structural points, as well as a number of functional examples provided in the gallery section (http://shiny.rstudio.com/gallery).

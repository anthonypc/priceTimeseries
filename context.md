## The Data ##

The data used in this app was sourced from the ads in Google's search result pages. This was done with a scraper monitoring a list of search terms.

Some processing was required to create the dataset used here. The display URLs in the ads required some cleaning before they could be used as a proxy for brand and the price information needed to be extracted from the headline and the adcopy. In this exercise, price is generally defined as anything that would match to "$[0-9,]+".
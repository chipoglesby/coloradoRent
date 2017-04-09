# devtools::install_github("Chicago/RSocrata")
library(RSocrata)
library(readr)

token <- read_file("token.txt")

coloradoRent <- read.socrata("https://data.colorado.gov/resource/yifv-9mje.json", app_token = token)
coloradoRent$averagerent <- as.numeric(coloradoRent$averagerent)
coloradoRent$year <- as.integer(coloradoRent$year)
coloradoRent$quarter <- as.integer(coloradoRent$quarter)

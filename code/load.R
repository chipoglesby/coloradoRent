library(RSocrata)
library(readr)
library(magrittr)
token <- read_file("token.txt")

# Download data and fix types

if(!file.exists("data/coloradoRent.csv")){
  if(!file.exists("token.txt")){
   print("You need an API token first")
  } else {
    coloradoRent <- read.socrata("https://data.colorado.gov/resource/yifv-9mje.json", app_token = token)
    coloradoRent$averagerent <- as.numeric(coloradoRent$averagerent)
    coloradoRent$year <- as.integer(coloradoRent$year)
    coloradoRent$quarter <- as.integer(coloradoRent$quarter)
    
    # Save data to CSV
    write_csv(coloradoRent, "data/coloradoRent.csv")
  }
} else {
  read_csv("data/coloradoRent.csv")  
  coloradoRent %<>% 
    na.omit()
}
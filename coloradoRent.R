# devtools::install_github("Chicago/RSocrata")
library(RSocrata)
library(dplyr)
library(readr)
library(ggplot2)
library(magrittr)

token <- read_file("token.txt")

coloradoRent <- read.socrata("https://data.colorado.gov/resource/yifv-9mje.json", app_token = token)
coloradoRent$averagerent <- as.numeric(coloradoRent$averagerent)
coloradoRent$year <- as.integer(coloradoRent$year)
coloradoRent$quarter <- as.integer(coloradoRent$quarter)

for (i in unique(coloradoRent$subregion)) {
  ggsave(
    coloradoRent %>%
      group_by(apartmenttype, year) %>%
      filter(grepl(paste(i, sep =""), subregion, fixed = TRUE)) %>% 
      summarise(medianRent = median(averagerent)) %>% 
      ggplot(aes(year, medianRent)) +
      geom_line(aes(color = apartmenttype), size = 1.5) +
      scale_x_continuous(
        breaks = seq(min(coloradoRent$year), max(coloradoRent$year), 1)) +
      ggtitle(paste(i," Rent ", min(coloradoRent$year)," - ", max(coloradoRent$year) , sep = "")) +
      xlab("Year") +
      ylab("Median Rent Price") + 
      theme(plot.title = 
              element_text(
                family = "Trebuchet MS", 
                color = "#666666", 
                face = "bold",
                size = 32,
                hjust = 0.5)) +
      theme(axis.title = 
              element_text(
                family = "Trebuchet MS",
                color = "#666666",
                face = "bold", 
                size = 22,
                hjust = 0.5)),
    file = 
      paste(gsub('[^0-9a-z]', '', tolower(i)), ".png", sep = ""), 
      path = "images", width = 17, height = 8.8, dpi = 72)
}
library(dplyr)
library(ggplot2)

ggsave(
  maxRent %>%  
    ggplot(aes(year, medianRent)) +
    geom_line(size = 1.5, color = '#43a2ca') +
    ggtitle(paste("Area:", maxRent$subregion[1], "&", "Apartment Type:", maxRent$apartmenttype[1], sep = " ")) +
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
  file = paste("maxRent", gsub('[^0-9a-z]', '', tolower(maxRent$subregion[1])), ".png", sep = ""), 
  path = "images", width = 17, height = 8.8, dpi = 72)
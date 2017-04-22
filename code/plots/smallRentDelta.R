library(dplyr)
library(ggplot2)

if(dir.exists("images/smallRentDelta") == FALSE) {
  dir.create("images/smallRentDelta")
  for (i in 1:nrow(smallRentDelta)) {
    ggsave(
      coloradoRent %>%
        na.omit() %>% 
        filter(tolower(subregion) == tolower(smallRentDelta$subregion[i]) &
                 tolower(apartmenttype) == tolower(smallRentDelta$apartmenttype[i])) %>%
        group_by(apartmenttype, year) %>%
        summarize(medianRent = median(averagerent)) %>% 
        ggplot(aes(year, medianRent)) +
        geom_line(size = 1.5, color = '#43a2ca') +
        ggtitle(paste("Area:",smallRentDelta$subregion[i], "&", "Apartment Type:", smallRentDelta$apartmenttype[i], sep = " ")) +
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
        paste(gsub('[^0-9a-z]', '', tolower(smallRentDelta$subregion[i])), ".png", sep = ""), 
      path = "images/smallRentDelta", width = 17, height = 8.8, dpi = 72)
  }
}
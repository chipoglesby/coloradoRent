library(dplyr)
library(ggplot2)

rentIncrease <- coloradoRent %>% 
  group_by(subregion, apartmenttype) %>%
  na.omit() %>% 
  summarize(delta = 
    round(sum(max(averagerent[year == max(year)]) - 
    min(averagerent[year == min(year)])) / 
    min(averagerent[year == min(year)]) * 100, 2)) %>% 
  filter(delta == max(delta))

if(dir.exists("images/rentIncrease") == FALSE) {
  dir.create("images/rentIncrease")
  for (i in 1:nrow(rentIncrease)) {
    ggsave(
      coloradoRent %>%
      na.omit() %>% 
      filter(tolower(subregion) == tolower(rentIncrease$subregion[i]) &
               tolower(apartmenttype) == tolower(rentIncrease$apartmenttype[i])) %>%
      group_by(apartmenttype, year) %>%
      summarize(medianRent = median(averagerent)) %>% 
      ggplot(aes(year, medianRent)) +
      geom_line(size = 1.5, color = '#43a2ca') +
      ggtitle(paste("Area:",rentIncrease$subregion[i], "&", "Apartment Type:", rentIncrease$apartmenttype[i], sep = " ")) +
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
      paste(gsub('[^0-9a-z]', '', tolower(rentIncrease$subregion[i])), ".png", sep = ""), 
      path = "images/rentIncrease", width = 17, height = 8.8, dpi = 72)
  }
}
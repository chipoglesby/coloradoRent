rentIncrease <- coloradoRent %>% 
  group_by(subregion, apartmenttype) %>%
  na.omit() %>% 
  summarize(delta = 
              round(sum(max(averagerent[year == max(year)]) - 
                          min(averagerent[year == min(year)])) / 
                      min(averagerent[year == min(year)]) * 100, 2)) %>% 
  filter(delta == max(delta))

rentDecrease <- coloradoRent %>% 
  group_by(subregion, apartmenttype) %>%
  na.omit() %>% 
  summarize(delta = 
              round(sum(max(averagerent[year == max(year)]) - 
                          min(averagerent[year == min(year)])) / 
                      min(averagerent[year == min(year)]) * 100, 2)) %>% 
  filter(delta == min(delta))


minRent <- coloradoRent %>% 
  filter(
    tolower(apartmenttype) == 
      tolower(coloradoRent$apartmenttype[coloradoRent$year == 
        max(coloradoRent$year) & coloradoRent$averagerent == 
        min(coloradoRent$averagerent[coloradoRent$year == 
        max(coloradoRent$year)])]) &
    tolower(subregion) == 
      tolower(coloradoRent$subregion[coloradoRent$year == 
        max(coloradoRent$year) & coloradoRent$averagerent == 
        min(coloradoRent$averagerent[coloradoRent$year == 
        max(coloradoRent$year)])])) %>% 
  group_by(year, apartmenttype, subregion) %>% 
  summarize(medianRent = min(averagerent))


maxRent <- coloradoRent %>% 
  filter(
    tolower(apartmenttype) == 
      tolower(coloradoRent$apartmenttype[coloradoRent$year == 
        max(coloradoRent$year) & coloradoRent$averagerent == 
        max(coloradoRent$averagerent[coloradoRent$year == 
        max(coloradoRent$year)])]) &
    tolower(subregion) == 
      tolower(coloradoRent$subregion[coloradoRent$year == 
        max(coloradoRent$year) & coloradoRent$averagerent == 
        max(coloradoRent$averagerent[coloradoRent$year == 
        max(coloradoRent$year)])])) %>% 
  group_by(year, apartmenttype, subregion) %>% 
  summarize(medianRent = max(averagerent))
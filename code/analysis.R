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
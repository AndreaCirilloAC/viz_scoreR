score <- 0

### barplot####

ggplot(airquality, aes(Day,Wind, fill = Month))+
  geom_bar(stat = 'identity') -> barplot

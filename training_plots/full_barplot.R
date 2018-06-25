score <- 0

### full_barplot####

ggplot(airquality, aes(Day,Wind))+
  geom_bar(stat = 'identity') -> full_barplot

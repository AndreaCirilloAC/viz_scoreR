score <- 0

### ugly_barplot####

ggplot(airquality, aes(Day,Wind, fill = Month))+
  geom_bar(stat = 'identity')+
  theme(panel.background = element_rect(fill = rgb(1,1,1),
                                        colour = "lightblue",
                                        size = 0.5, linetype = "solid") ) -> ugly_barplot

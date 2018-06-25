score <- 0

### bad_labels####

ggplot(airquality, aes(Day,Wind, fill = Month))+
  geom_bar(stat = 'identity') +
  theme(panel.background = element_rect(fill = rgb(1,1,1),
                                        colour = "lightblue",
                                        size = 0.5, linetype = "solid") )+
  labs(title = "my$value",x = "find_it", y = ":) smile")-> bad_labels

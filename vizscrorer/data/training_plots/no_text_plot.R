score <- 0


### no_text_plot####

ggplot(airquality, aes(Day,Wind, label= Month))+
  geom_point()-> no_text_plot

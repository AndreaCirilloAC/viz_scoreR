score <- 1
ggplot(mpg, aes(class))+
  geom_bar(aes(fill = drv), position = position_stack(reverse = TRUE)) +
  coord_flip() +
  theme(legend.position = "top")->horizontal_bar_aes

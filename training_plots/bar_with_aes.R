score <- 0
ggplot(mpg, aes(class))+
  geom_bar(aes(fill = drv))->bar_with_aes

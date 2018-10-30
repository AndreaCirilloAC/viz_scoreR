score <- 0

### scatter_plot####
diamonds %>% 
  filter(price >12000) %>% 
  ggplot( aes(price,table))+ 
  geom_point(aes(colour = color))-> scatter_plot


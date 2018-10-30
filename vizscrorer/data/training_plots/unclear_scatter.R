score <- 0

diamonds %>% 
  filter(cut == ("Premium"), color %in% c( "D","E") ) %>% 
ggplot(aes(carat, price))+
  geom_point()->unclear_scatter

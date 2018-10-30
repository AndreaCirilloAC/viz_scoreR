score <- 0
set.seed(1410)  
dsmall <- as.data.frame(diamonds[sample(nrow(diamonds), 1000), ])
ggplot(dsmall, aes(carat, price, color=color)) + 
  geom_point(size=4)->large_dots


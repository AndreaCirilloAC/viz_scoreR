score <- 0

ggplot(mpg, aes(displ, hwy, color = cyl))+
  geom_point() + geom_jitter(position = position_jitter(height = .5))

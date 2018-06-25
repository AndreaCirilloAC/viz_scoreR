score <- 0

ggplot(mtcars, aes(x=wt, y=mpg)) + 
  geom_point(aes(size=qsec))->inflating_points

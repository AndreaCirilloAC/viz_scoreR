score <- 0

ggplot(mtcars, aes(wt, mpg))+ 
  geom_point(aes(size = qsec))->try_again

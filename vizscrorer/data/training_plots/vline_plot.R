score <- 0

ggplot(mtcars, aes(wt, mpg)) + geom_point()+geom_vline(xintercept = 5)->vline_plot

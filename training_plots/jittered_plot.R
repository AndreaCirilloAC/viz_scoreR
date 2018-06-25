score <- 1

jittered_plot <-  ggplot(mpg, aes(cty, hwy))+
  geom_jitter(width = .5, size=1) +
  labs(subtitle="mpg: city vs highway mileage", 
       y="hwy", 
       x="cty", 
       title="Jittered Points")

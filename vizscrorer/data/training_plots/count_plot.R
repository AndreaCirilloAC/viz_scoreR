score <- 1

####count_plot ####

count_plot <-  ggplot(mpg, aes(cty, hwy))+
  geom_count(col="tomato3", show.legend=F) +
  labs(subtitle="mpg: city vs highway mileage", 
       y="hwy", 
       x="cty", 
       title="Counts Plot")


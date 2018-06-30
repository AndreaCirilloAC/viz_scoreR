library(faraway)

score <- 0

ggplot(nepali, aes(x = ht)) + 
  geom_histogram(fill = "lightblue", color = "black") + 
  ggtitle("Height of children") + 
  xlab("Height (cm)") + 
  xlim(c(0, 120))->nepali_plot

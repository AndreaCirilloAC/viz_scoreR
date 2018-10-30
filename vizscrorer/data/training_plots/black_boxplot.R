score <- 0

ggplot(ToothGrowth, aes(x=dose, y=len, group=supp)) + geom_boxplot()+
theme(
  axis.text.x = element_blank(), # Remove x axis tick labels
  axis.text.y = element_blank(), # Remove y axis tick labels
  axis.ticks = element_blank()) ->black_boxplot# Remove ticks

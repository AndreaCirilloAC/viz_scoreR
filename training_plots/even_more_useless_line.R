score <- 0

dat <- data.frame(
  time = factor(c("Lunch","Dinner"), levels=c("Lunch","Dinner")),
  total_bill = c(14.89, 17.23)
)

ggplot(data=dat, aes(x=time, y=total_bill, group=1)) + 
  geom_line(colour="red", linetype="dashed", size=1.5) + 
  geom_point(colour="red", size=4, shape=21, fill="white")-> even_more_useless_line

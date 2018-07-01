score <- 1


dat <- data.frame(
  time = factor(c("Lunch","Dinner"), levels=c("Lunch","Dinner")),
  total_bill = c(14.89, 17.23)
)

ggplot(data=dat, aes(x=time, y=total_bill, fill=time)) + 
  geom_bar(colour="black", fill="#DD8888", width=.8, stat="identity") + 
  guides(fill=FALSE) +
  xlab("Time of day") + ylab("Total bill") +
  ggtitle("Average bill for 2 people")->getting_bad_with_bar

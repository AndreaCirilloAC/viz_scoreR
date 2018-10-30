score <- 0

dat <- data.frame(
  time = factor(c("Lunch","Dinner"), levels=c("Lunch","Dinner")),
  total_bill = c(14.89, 17.23)
)


ggplot(data=dat, aes(x=time, y=total_bill)) +
  geom_bar(stat="identity")->talking_bad_bar

score <- 0

dat <- data.frame(
  time = factor(c("Lunch","Dinner"), levels=c("Lunch","Dinner")),
  total_bill = c(14.89, 17.23)
)

ggplot(data=dat, aes(x=time, y=total_bill, fill=time)) +
  geom_bar(colour="black", stat="identity")-> another_bad_bar

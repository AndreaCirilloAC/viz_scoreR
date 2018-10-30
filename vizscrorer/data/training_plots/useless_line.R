score <- 0

dat <- data.frame(
  time = factor(c("Lunch","Dinner"), levels=c("Lunch","Dinner")),
  total_bill = c(14.89, 17.23)
)

ggplot(data=dat, aes(x=time, y=total_bill, group=1)) +
  geom_line()-> useless_line
## This would have the same result as above
# ggplot(data=dat, aes(x=time, y=total_bill)) +
#     geom_line(aes(group=1))

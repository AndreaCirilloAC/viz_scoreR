score <- 0
dataframe = data.frame(
  x = rep(1,times=6),
  val  = c( 8 ,  6 ,  9 ,  4 ,  2 , 3.5),
  labs = c("a", "b", "c", "d", "e", "f") )
ggplot(dataframe, aes(x, val, fill=labs, width=0.2)) + geom_bar(stat="identity")->stacked

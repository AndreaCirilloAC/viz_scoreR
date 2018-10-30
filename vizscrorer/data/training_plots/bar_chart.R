score <- 0

dataframe = data.frame(
  val  = c( 8 ,  6 ,  9 ,  4 ,  2 , 3.5),
  labs = c("a", "b", "c", "d", "e", "f") )
ggplot(dataframe, aes(y = val, x = labs)) + geom_bar(stat = "identity")->bar_chart

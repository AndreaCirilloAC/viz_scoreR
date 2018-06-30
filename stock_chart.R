score <-  1
set.seed(6)
#Simulate two stocks (random walk)

StockA = 100
StockB = 100

StockFrame <- matrix(nrow=1000,ncol=3)

StockFrame[1,] <- c(1,100,100)

for (i in 2:1000){
  StockA = StockA * 1+rnorm(1)
  StockB = StockB * 1+rnorm(1)
  
  StockFrame[i,] <- c(i,StockA,StockB)
  
}

StockFrame <- data.frame(StockFrame)
colnames(StockFrame) <- c("Time","StockA","StockB")

library(reshape2)

meltdf <- melt(StockFrame,id="Time")


ggplot(meltdf,aes(x=Time,y=value,colour=variable)) +
  geom_line() +
  theme(legend.title = element_blank(),legend.position = c(0.9,0.9)) +
  labs(title="Time-series example (Rebased y value)")-> stock_chart

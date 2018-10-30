score <- 1

srbankQuotes <- read.csv("http://quotes.hegnar.no/paperhistory.php?paper=SRBANK.OSE&csv_format=csv") #Grab SRbank stock price (working jan 17)

library(lubridate) #use this to easily handle dates
srbankQuotes$date <- ymd(srbankQuotes$quote_date) #Convert int to date
srbankQuotes <- srbankQuotes[srbankQuotes$date>=as.Date("2015-01-01")&srbankQuotes$date<=as.Date("2017-01-20"),] #Limit time period

ggplot(srbankQuotes,aes(x=date,y=close)) +
  geom_line(color="salmon") +
  theme(legend.title = element_blank(),legend.position = c(0.9,0.9)) +
  labs(title="SR-Bank Stock prices",subtitle="01 Jan 2015 - 20 Jan 2017, Important dates highlighted",x="",y="Price, NOK") +
  
  #Do the actual annotations
  annotate("text",x=as.Date("2016-08-10"),y=55,label="01 September 2016 \nRuben joins the bank",size=3,fontface="italic") +
  annotate("segment",x=as.Date("2016-09-01"),xend=as.Date("2016-09-01"),y=srbankQuotes$close[srbankQuotes$date=="2016-09-01"],yend=53,linetype=2) +
  annotate("text",x=as.Date("2016-10-01"),y=62,label="03 October 2016 \nMark joins the bank",size=3,fontface="italic") +
  annotate("segment",x=as.Date("2016-10-03"),xend=as.Date("2016-10-03"),y=srbankQuotes$close[srbankQuotes$date=="2016-10-03"],yend=54,linetype=2) + 
  annotate("segment",x=as.Date("2016-10-03"),xend=as.Date("2016-10-03"),y=56.5,yend=60,linetype=2) ->great_stock_chart

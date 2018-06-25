score <- 0


### histogram####

ggplot(airquality, aes(Wind))+
  geom_histogram(data=subset(airquality,Wind >10))->histogram


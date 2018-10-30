score <- 0
## more plots

### pie_chart####

ggplot(airquality, aes(x = Month, Wind))+
  geom_bar(stat = 'identity')+
  coord_cartesian()+
  coord_polar("y")+
  labs(title = "titolo")-> pie_chart

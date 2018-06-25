score <- 0

### bubble_chart####

ggplot(airquality, aes(x = Month, Wind,size= Day))+
  geom_line()+
  labs(title = "titolo")-> bubble_chart

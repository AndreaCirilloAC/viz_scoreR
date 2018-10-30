score <- 0

PlantGrowth$x_coord <- rep(1,times =30) 

ggplot(PlantGrowth, aes(x=x_coord, fill=group))+
  geom_bar(width = 1)+
  coord_polar("y")->plant_growth_pie

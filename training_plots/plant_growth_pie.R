score <- 0
ggplot(PlantGrowth, aes(x=factor(1), fill=group))+
  geom_bar(width = 1)+
  coord_polar("y")->plant_growth_pie

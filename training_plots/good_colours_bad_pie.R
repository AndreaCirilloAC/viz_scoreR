score <- 0

df <- data.frame(
  x = c(1,1,1),
  group = c("Male", "Female", "Child"),
  value = c(25, 25, 50)
)

ggplot(df, aes(x=x, y=value, fill=group))+
  geom_bar(width = 1, stat = "identity") + 
  coord_polar("y", start=0)+
scale_fill_manual(values=c("#999999", "#E69F00", "#56B4E9"))->good_colours_bad_pie

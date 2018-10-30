score <- 0

df <- data.frame(
  x_coord = c(1,1,1),
  group = c("Male", "Female", "Child"),
  value = c(25, 25, 50)
)

ggplot(df, aes(x=x_coord, y=value, fill=group))+
  geom_bar(width = 1, stat = "identity")+
  coord_polar("y", start=0)+
scale_fill_brewer(palette="Dark2")->still_good_colours_and_bad_pie

score <- 1

library(dplyr)
noteworthy_players <- worldcup %>% filter(Shots == max(Shots) | 
                                            Passes == max(Passes)) %>%
  mutate(point_label = paste(Team, Position, sep = ", "))

ggplot(worldcup, aes(x = Passes, y = Shots)) + 
  geom_point() + 
  geom_text(data = noteworthy_players, aes(label = point_label), 
            vjust = "inward", hjust = "inward") ->worldcup_plot

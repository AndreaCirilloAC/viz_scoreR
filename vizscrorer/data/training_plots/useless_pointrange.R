score <- 0

data = data.frame(student = c("Tina", "Trish", "Kevin", "Rebecca", "Sarah"),
                  percentile = c(25, 95, 54, 70, 99)  ) #percentile of d levels

#### useless_pointrange####

useless_pointrange <- ggplot(data, aes(x = student, y = percentile))+ 
  geom_pointrange(aes(ymin = 0, ymax = 100)) + coord_flip()


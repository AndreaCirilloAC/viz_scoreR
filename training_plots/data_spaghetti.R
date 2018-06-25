score <- 0

## dataspaghetti

library(reshape2)
line_data <- data.frame(x_val = 1:50)

for (letter in letters){
  slope = rnorm(1)
  line_data[,letter] <- sin(line_data$x_val + rnorm(1))*slope + rnorm(50)
}

#melt the big dataframe to a tidy one.
tidy_lines = melt(line_data, id = c("x_val"))

#plot with different lines for different letters.
#       data                               color code by letter    draw lines                     add a title

### data_spaghetti####

data_spaghetti <- ggplot(tidy_lines, aes(x = x_val, y = value, color = variable)) + 
  geom_line() + 
  labs(title = "Delicious data spagetti")

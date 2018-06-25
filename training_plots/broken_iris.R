score <- 0

ggplot(iris, aes(Petal.Length, Petal.Width, group=Species, 
                      color=Species)) + geom_line() -> broken_iris

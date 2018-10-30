
score <- 1

set.seed(1234)
dat <- data.frame(cond = factor(rep(c("A","B"), each=200)), 
                  rating = c(rnorm(200),rnorm(200, mean=.8)))

ggplot(dat, aes(x=rating)) +
  geom_histogram(binwidth=.5, colour="black", fill="white")-> white_normal_distribution

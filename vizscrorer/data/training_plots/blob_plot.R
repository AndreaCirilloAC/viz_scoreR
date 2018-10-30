score <- 0

dat <- data.frame(cond = factor(rep(c("A","B"), each=200)), 
                  rating = c(rnorm(200),rnorm(200, mean=.8)))

ggplot(dat, aes(x=rating)) + geom_density()->blob_plot

score <- 1
set.seed(1)
a <- rnorm(n = 10000,mean = -1,sd = 0.7)
b <- rnorm(n = 10000,mean=-2,sd=1.25)
c <- rnorm(n=10000,mean=-1,sd=2)
d <- rnorm(n=10000,mean=2,sd=0.5)

groupvec <- c(rep("a",10000),rep("b",10000),rep("c",10000),rep("d",10000))

datavec <- c(a,b,c,d)

histframe <- data.frame(groupvariable=groupvec,datavec)

ggplot(histframe,aes(x=datavec,fill=groupvariable)) +
  #Must use identity when plotting multiple histograms, else the result is one weird combined histogram
  geom_histogram(position = "identity",alpha=0.6,binwidth = 0.05) + 
  labs(title="Overlay histograms",subtitle="Properly plot more than one histogram on same chart")-> good_distribution_plot

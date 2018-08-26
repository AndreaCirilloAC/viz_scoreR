library(cluster) # function daisy
library(dplyr)
library(ggplot2)
library(energy)
library(caret)
library(tidyr)
## file sourcing to obtain function in the global environment and the final metadata_reader function
scripts <- (paste("R/",list.files("R"),sep =""))
for ( i in 1: length(scripts)){
  source(scripts[i],local = TRUE)
}

flowers <- ggplot(data = iris,aes(x = Species,y = Petal.Length)) + geom_point()

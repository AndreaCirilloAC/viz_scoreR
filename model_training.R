library(caret)
library(skimr)
library(plyr)
estimation_db$good_plot <- revalue(estimation_db$good_plot , c("0"="bad", "1"="good"))

estimation_db  %>%
          select(-plot_name)-> final_db
  



createDataPartition(
  y = final_db$good_plot,
  ## the outcome data are needed
  p = .95,
  ## The percentage of data in the
  ## training set
  list = FALSE) -> train_subset


training <- final_db[ train_subset,-1] #remove the plot name column
testing  <- final_db[-train_subset,-1]

nrow(training)

nrow(testing)

control <-  trainControl( classProbs = TRUE)

gbmGrid <-  expand.grid(interaction.depth = c(1, 5, 9), 
                        n.trees = (1:30)*50, 
                        shrinkage = 0.1,
                        n.minobsinnode = 20)

gbm_fit <- train(  good_plot~.,
  data = training,
  method = "gbm",
trControl = control,
  verbose = FALSE,
tuneGrid = gbmGrid)

plot(gbm_fit)

#aggiungi questi:
#  http://www.cookbook-r.com/Graphs/Plotting_distributions_(ggplot2)/ ca 16
#http://www.cookbook-r.com/Graphs/Plotting_means_and_error_bars_(ggplot2)/ 13
#http://www.cookbook-r.com/Graphs/Scatterplots_(ggplot2)/ 11

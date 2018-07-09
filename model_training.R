library(caret)
library(skimr)
  
createDataPartition(
  y = estimation_db$good_plot,
  ## the outcome data are needed
  p = .80,
  ## The percentage of data in the
  ## training set
  list = FALSE) -> train_subset

training <- estimation_db[ train_subset,-1] #remove the plot name column
testing  <- estimation_db[-train_subset,-1]

nrow(training)

nrow(testing)

control <-  trainControl(interaction.depth = 9)

gbm_fit <- train(  good_plot~.,
  data = training,
  method = "gbm",
#  trControl = control,
  verbose = FALSE
)

plot(gbm_fit)

#http://topepo.github.io/caret/model-training-and-tuning.html#fitting-models-without-parameter-tuning


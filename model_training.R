library(caret)



  createDataPartition(
  y = estimation_db$good_plot,
  ## the outcome data are needed
  p = .75,
  ## The percentage of data in the
  ## training set
  list = FALSE)-> train_subset

training <- estimation_db[ inTrain,-1]
testing  <- estimation_db[-inTrain,-1]

nrow(training)

nrow(testing)

plsFit <- train(
  good_plot ~ .,
  data = training,
  method = "pls",
  ## Center and scale the predictors for the training
  ## set and all future samples.
  preProc = c("center", "scale")
)

ggplot(plsFit)

plsFit

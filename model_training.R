library(caret)
library(skimr)
library(plyr)
estimation_db$good_plot <- revalue(estimation_db$good_plot , c("0"="bad", "1"="good"))

estimation_db  %>%
          select(-plot_name)-> final_db
  

createDataPartition(
  y = final_db$good_plot,
  ## the outcome data are needed
  p = .90,
  ## The percentage of data in the
  ## training set
  list = FALSE) -> train_subset


training <- final_db[ train_subset,-1] #remove the plot name column
testing  <- final_db[-train_subset,-1]

nrow(training)

nrow(testing)

control <-  trainControl( classProbs = TRUE)

gbmGrid <-  expand.grid(interaction.depth = c(1, 5, 9), 
                        n.trees = (1:10), 
                        shrinkage = 0.09,
                        n.minobsinnode = 5)

gbm_fit <- train(  good_plot~.,
  data = training,
  method = "gbm",
trControl = control,
  verbose = FALSE,
tuneGrid = gbmGrid)

plot(gbm_fit)

prediction <- predict(gbm_fit,newdata = testing[,-ncol(testing)])
probabilities <- extractProb(list(gbm=gbm_fit),testX = testing[,-ncol(testing)],testY = testing$good_plot)
probabilities_test <- probabilities %>% filter(dataType == "Test")
confusionMatrix(probabilities_test$pred,probabilities_test$obs, positive = "good")

#save(gbm_fit, file = "vizscrorer//model_fit.Rdata")
devtools::use_data(gbm_fit,pkg = "vizscrorer",internal = TRUE, overwrite = TRUE)

#create a data frame to be used when comparing analysed plot with the estimation db
probabilities %>% select(good,model)->comparison_db
write.csv(comparison_db, file = "vizscrorer/inst/extdata/comparison_db.csv")

#aggiungi questi:
# http://www.cookbook-r.com/Graphs/Plotting_distributions_(ggplot2)/ ca 16
#http://www.cookbook-r.com/Graphs/Plotting_means_and_error_bars_(ggplot2)/ 13
#http://www.cookbook-r.com/Graphs/Scatterplots_(ggplot2)/ 11

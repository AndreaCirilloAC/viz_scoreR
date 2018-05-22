cozy_plot <- function(plot_object, n_of_layers, overplotting_threshold){
if (TRUE == FALSE){ # if the test is positive we are looking at an histogram and there is no reason for looking for overplotting
  NA}else{
  # we look here for overplotting. To do this we compute a ratio between the number of modalities 
  ## in x and the number of modalities in y
  x_vector <- aes_puller(plot_object,n_of_layers, "x")
  y_vector <- aes_puller(plot_object,n_of_layers, "y")

  n_values_x <- length(unique(x_vector))
  n_values_y <- length(unique(y_vector))
  ratio_y_over_x <- n_values_y / n_values_x
  ratio_x_over_y <- n_values_x / n_values_y
  test_result <- ratio_x_over_y > overplotting_threshold| ratio_y_over_x > overplotting_threshold
  
  return(list("test_result" = test_result,
              "ratio_y_over_x" = ratio_y_over_x,
              "ratio_x_over_y" = ratio_x_over_y))
    }
}

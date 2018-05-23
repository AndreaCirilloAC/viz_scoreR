cozy_plot <- function(plot_object, n_of_layers, overplotting_threshold){
if (TRUE == FALSE){ # if the test is positive we are looking at an histogram and there is no reason for looking for overplotting
  NA}else{
  # we look here for overplotting. To do this we compute the median euclidean distance as a measure
    # of plot density
  x_vector <- aes_puller(plot_object,n_of_layers, "x")
  y_vector <- aes_puller(plot_object,n_of_layers, "y")

  
  median_distance <- median(daisy(data.frame(x_vector,y_vector)))
  
  test_result <- median_distance < overplotting_floor
  
  return(list("test_result" = test_result,
              "median_distance" = median_distance))
    }
}

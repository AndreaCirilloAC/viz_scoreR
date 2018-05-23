cozy_plot <- function(plot_object, n_of_layers, overplotting_threshold){
  aes_vector <- mappings_lister(plot_object,n_of_layers)
if (is.na(match("y",aes_vector))){ #if there is no y we are probably "looking" at an histogram, for which no overplotting check is provided
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

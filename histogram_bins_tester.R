histogram_bins_tester <- function(plot_objects, n_of_layers){
# first of all I look for a GeomBar layer and a binwidth parameter. the occurence of 
  # both means we are "looking" at an histogram ( there is no separate geom)
  bar_index <- match("GeomBar", geoms_lister(plot_object,n_of_layers))
  bar_stat_params <- if(bar_index > 0){plot_object$layers[[bar_index]]$stat_params %>% names()}
  test_histogram <- bar_index > 0 & match("binwidth",bar_stat_params)
# if the plot actually seems to be an histogram I retrieve di x variable and compute on it
  ## the optimal number of bins based on the Freedman Diaconis rule

if(test_histogram){
aes_db     <- mappings_lister(plot_object , n_of_layers )
variable_name   <- aes_db %>% filter(aes == "x") %>% select("variable") %>% pull()
variable_vector <- plot_object$data[,variable_name]
optimal_bw       <-  2 * (IQR(variable_vector) / length(variable_vector)^(1/3)) 
actual_bw_index  <- match("binwidth",bar_stat_params)
actual_bw          <- plot_object$layers[[bar_index]]$stat_params[[actual_bw_index]] 

if (is.null(actual_bw)){
  actual_bw <- diff(range(variable_vector))/default_n_of_bins
  } # we handle here the common case of the user not changing the default setting for bins size

# after retrieving or computing the actual binwidth I compute the distance from the optimum
  # this will be taken into consideration when computing the final score.
distance_from_optimum <- optimal_bw - actual_bw
optimization_data <- list("test" = TRUE,"optimal_bw" = optimal_bw, "distance_from_optimum" = distance_from_optimum)
return(optimization_data)  
  }else{list(FALSE,FALSE,FALSE)}
  

}

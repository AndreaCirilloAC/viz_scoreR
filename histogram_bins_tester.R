histogram_bins_tester <- function(plot_objects){
# first of all I look for a GeomBar layer and a binwidth parameter. the occurence of 
  # both means we are "looking" at an histogram ( there is no separate geom)
  bar_index <- match("GeomBar", geoms_lister(plot_object,n_of_layers))
  bar_stat_params <- if(bar_index > 0){plot_object$layers[[1]]$stat_params %>% names()}
  test_histogram <- bar_index > 0 & match("binwidth",bar_stat_params)
  
  # if(test_histogram){
  #   p_build$data[[bar_index]]
  #   theoretical_binwidth <-     
  }

  
    
#  bw <- diff(range(x)) / (2 * IQR(x) / length(x)^(1/3))  
}

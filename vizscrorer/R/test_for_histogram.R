test_for_histogram <- function(plot_object,n_of_layers){
  bar_index <- match("GeomBar", geoms_lister(plot_object,n_of_layers))
  bar_stat_params <- if(!is.na(bar_index )){plot_object$layers[[bar_index]]$stat_params %>% names()}
  test_histogram <- !is.na(bar_index) & !is.na(match("binwidth",bar_stat_params))
  return(test_histogram)
}

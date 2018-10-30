coordinates_lister <- function(plot_object){
  plot_object$coordinates %>% class() %>% as.vector()  
}

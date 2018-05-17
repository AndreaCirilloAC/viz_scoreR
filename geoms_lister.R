geoms_lister <- function(plot_object, n_of_layers){
  geoms_in_plot <- c()
  for(i in 1:n_of_layers){  
    
    class_list <- plot_object$layers[[i]]$geom %>% class() %>% as.vector()
    geom <- class_list[1]
    geoms_in_plot <- c(geoms_in_plot,geom)
  }
  return(geoms_in_plot)
}

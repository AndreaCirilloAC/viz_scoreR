mappings_lister <- function(plot_object,n_of_layers){
  aes_names <- c()
  for(i in 1:n_of_layers){
    aes_names_partial <- plot_object$layers[[i]]$mapping %>% unlist() %>% names()
    aes_names <- append(aes_names,aes_names_partial)
  }

  #in the end I add the mapping set into ggplot()
  aes_names <- append(aes_names,plot_object$mapping %>% unlist() %>% names())
  return(aes_names)
}

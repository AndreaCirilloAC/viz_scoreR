aes_puller <- function(plot_object,n_of_layers, required_aes){
  
  aes_db     <- mappings_lister(plot_object , n_of_layers )
  variable_name   <- aes_db %>% filter(aes == required_aes) %>% select("variable") %>% pull()
  if(length(variable_name)== 0 ){return(NA)}else{
  variable_vector <- plot_object$data[,variable_name] 

  return(variable_vector)}
}

does_it_need_geom_smooth <- function(plot_object, n_of_layers,correlation_threshold){
  
  # first we check for correlations ( of any type) among points
  raw_x <- aes_puller(plot_object,n_of_layers, "x")
  if(mode(raw_x) == "list"){x_vector <- raw_x[,1] %>% pull}else{x_vector <- raw_x}
  raw_y <- aes_puller(plot_object,n_of_layers, "y")
  if(mode(raw_y) == "list"){y_vector <- raw_y[,1] %>% pull}else{y_vector <- raw_y}
  not_handled <- c("factor","character")
  #check on variabe type
  if(class(x_vector) %in% not_handled | class(y_vector) %in% not_handled){return(list(NA,NA,NA))
    } else if(!is.na(x_vector) & !is.na(y_vector)){
    distance_correlation <- dcor(x_vector,y_vector)
  }else{distance_correlation <- 2}
  
  # if the level of correlation is relevant we look for the presence of geom_smooth
  if(abs(distance_correlation)>correlation_threshold & distance_correlation != 2){
    geoms_vector <- geoms_lister(plot_object, n_of_layers)
    if(!is.na(match("GeomSmooth",geoms_vector))){return(list(FALSE,distance_correlation))}else{
      return(list(TRUE,distance_correlation)) # if we have a relevant correlation and no geom smooth we suggest to add one
    }
      
  }else if(distance_correlation == 2){return(list(NA,NA))}
  else{
    return(list(FALSE,distance_correlation))
  }
}

cozy_plot <- function(plot_object, n_of_layers, overplotting_floor){
  aes_db <- mappings_lister(plot_object,n_of_layers)
if (is.na(match("y",aes_db$aes))){ #if there is no y we are probably "looking" at an histogram, for which no overplotting check is provided
  return(list(NA,NA))}else{
  # we look here for overplotting. To do this we compute the median euclidean distance as a measure
    # of plot density
    raw_x <- aes_puller(plot_object,n_of_layers, "x")
    if(mode(raw_x) == "list"){x_vector <- raw_x[,1] %>% pull}else{x_vector <- raw_x}
    raw_y <- aes_puller(plot_object,n_of_layers, "y")
    if(mode(raw_y) == "list"){y_vector <- raw_y[,1] %>% pull}else{y_vector <- raw_y}

    not_handled <- c("factor","character")
    #check on variabe type
    if(class(x_vector) %in% not_handled | class(y_vector) %in% not_handled){return(list(NA,NA))}else{
    
  median_distance <- median(daisy(data.frame(x_vector,y_vector)))
  
  test_result <- median_distance < overplotting_floor
  
  return(list("test_result" = test_result,
              "median_distance" = median_distance))
    }
  }
  
}  

labels_finder <- function(plot_object,searched_label){
  labels_vector <- plot_object$labels %>% names() %>% as.vector()
  label_found <- if(is.na(match(searched_label,labels_vector))){FALSE}else{TRUE}
  
  }

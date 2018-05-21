too_few_data <- function(plot_object) {
  if(plot_object$data %>% nrow() < data_threshold){FALSE}else{TRUE}
}

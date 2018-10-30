too_few_data <- function(plot_object,data_threshold) {
  if(plot_object$data %>% nrow() < data_threshold){FALSE}else{TRUE}
}

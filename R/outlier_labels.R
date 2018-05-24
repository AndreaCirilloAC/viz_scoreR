outlier_labels <- function(plot_object){
  
  #draw_data
  x_vector <- aes_puller(plot_object,n_of_layers, "x")
  y_vector <- aes_puller(plot_object,n_of_layers, "y")
  

  # look for outliers
  x_outliers <- boxplot.stats(x_vector)$out
  y_outliers <- boxplot.stats(y_vector)$out
  
  if (length((x_outliers))>0|length(y_outliers)>0){ #we preliminary check for outliers presence, to avoid unnecessary computations
  # look for geom_text
    text_index <- match("GeomText",geoms_lister(plot_object, n_of_layers ))
    # if text is found I look at data to see if we are looking the outliers are labeled
   if(is.na(text_index)){return(FALSE)}else if(text_index > 0){
     
     text_x <- p_build$data[[text_index]]$x
     text_y <- p_build$data[[text_index]]$y
     
     x_outliers_are_labelled <- if(length(x_outliers)==0){NA}else if(x_outliers%in% text_x){TRUE}else{FALSE}
     y_outliers_are_labelled <- if(length(y_outliers)==0){NA}else if(y_outliers%in% text_y){TRUE}else{FALSE}
     
     general_result <- if(is.na(x_outliers_are_labelled) &is.na(y_outliers_are_labelled)){
       NA} else{if(prod(x_outliers_are_labelled,y_outliers_are_labelled, na.rm = TRUE)== TRUE){TRUE}else{FALSE}}
     
     return(general_result)
   }else{return(FALSE)}
  
  }
}

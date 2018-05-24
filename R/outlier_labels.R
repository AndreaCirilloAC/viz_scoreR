outlier_labels <- function(plot_object,n_of_layers,p_build){
  
  #draw_data
  raw_x <- aes_puller(plot_object,n_of_layers, "x")
  if(mode(raw_x) == "list"){x_vector <- raw_x[,1] %>% pull}else{x_vector <- raw_x}
  raw_y <- aes_puller(plot_object,n_of_layers, "y")
  if(mode(raw_y) == "list"){y_vector <- raw_y[,1] %>% pull}else{y_vector <- raw_y}

############ x
if(is.na(x_vector)){x_outliers_are_labelled <- NA}else{  
  # look for outliers
  x_outliers <- boxplot.stats(x_vector )$out

  
  if (length((x_outliers))>0){ #we preliminary check for outliers presence, to avoid unnecessary computations
    # look for geom_text
    text_index <- match("GeomText",geoms_lister(plot_object, n_of_layers ))
    # if text is found I look at data to see if we are looking the outliers are labeled
    if(is.na(text_index)){return(FALSE)}else if(text_index > 0){
      
      text_x <- p_build$data[[text_index]]$x

      
      x_outliers_are_labelled <- if(length(x_outliers)==0){NA}else if(x_outliers%in% text_x){TRUE}else{FALSE}
      
      }}else{x_outliers_are_labelled <-  NA}}

########### y

  if(is.na(y_vector)){y_outliers_are_labelled <- NA}else{  
  
  # look for outliers

  y_outliers <- boxplot.stats(y_vector)$out
  
  if (length(y_outliers)>0){ #we preliminary check for outliers presence, to avoid unnecessary computations
  # look for geom_text
    text_index <- match("GeomText",geoms_lister(plot_object, n_of_layers ))
    # if text is found I look at data to see if we are looking the outliers are labeled
   if(is.na(text_index)){return(FALSE)}else if(text_index > 0){

     text_y <- p_build$data[[text_index]]$y

     y_outliers_are_labelled <- if(length(y_outliers)==0){NA}else if(y_outliers%in% text_y){TRUE}else{FALSE}
     
   }}else{y_outliers_are_labelled <-  NA}}
###############     
     general_result <- if(is.na(x_outliers_are_labelled) &is.na(y_outliers_are_labelled)){
       NA} else{if(prod(x_outliers_are_labelled,y_outliers_are_labelled, na.rm = TRUE)== TRUE){TRUE}else{FALSE}}
     
     return(general_result)
}

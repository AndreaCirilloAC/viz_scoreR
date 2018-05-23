grey_background <- function(plot_object){
  # we check here if the default background is being used AND
  # if the default background is still the grey one
  
  default_theme <- theme_get()
  default_is_grey <- pmatch("grey",default_theme$panel.background$fill)
  if(length(as.character(plot_object$theme)) == 0 & default_is_grey>0){
    TRUE
  }else{FALSE}
}

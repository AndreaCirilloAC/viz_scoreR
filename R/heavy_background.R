heavy_background <- function(plot_object){
  # we check here if the default background is being used AND
  # if the default background is still the grey one
  
  default_theme <- theme_get()
  default_is_grey <- pmatch("grey",default_theme$panel.background$fill)
  background_fill <- plot_object$theme$panel.background$fill
  if(length(as.character(plot_object$theme)) == 0 & default_is_grey>0){
    TRUE # the default theme is being used and this produces to a grey background
  }else{
    if(!(background_fill %in% c(rgb(1,1,1),"FFFFFF", "white", "transparent"))==FALSE){ # if the background is not white or transparent we say it is heavy, tertium non datur
      TRUE}else{
        FALSE}
  }
}





subset(background_fill, !(background_fill %in% c('B','N','T')))
subset(c("A","B"), !("A" %in% c("B","D")))

heavy_background <- function(plot_object){
  # we check here if the default background is being used AND
  # if the default background is still the grey one
  
  default_theme <- theme_get()
  default_is_grey <- pmatch("grey",default_theme$panel.background$fill)
  background_fill <- plot_object$theme$panel.background$fill
  if((length(as.character(plot_object$theme))== 0|is.null(background_fill))  & !is.na(default_is_grey)){
    TRUE # the default theme is being used and this produces to a grey background
  }else{
    if(background_fill %in% c(rgb(1,1,1),"#FFFFFF", "white", "transparent")){ # if the background is not white or transparent we say it is heavy, tertium non datur
      FALSE}else{
        TRUE}
  }
}

is_pie_chart <- function(plot_object, n_of_layers){

  # if we do not found any geom_bar we can be sure it is not a pie chart
  
!is.na(match("GeomBar",geoms_lister(plot_object,n_of_layers)))

  }


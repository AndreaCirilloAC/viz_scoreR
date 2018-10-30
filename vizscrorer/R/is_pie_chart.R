is_pie_chart <- function(plot_object, n_of_layers){

  coordinates_class <-   coordinates_lister(plot_object)
  
  # if we do not found any geom_bar we can be sure it is not a pie chart
  
test_for_geom_bar(plot_object,n_of_layers)& !is.na(match("CoordPolar",coordinates_class))

  }


is_horizontal_barplot <- function(plot_object,n_of_layers){
  is_bar_plot <- test_for_geom_bar(plot_object,n_of_layers)
  is_flipped <- !is.na(match("CoordFlip" ,coordinates_lister(plot_object)))
  if(!is_bar_plot){return(FALSE)}else{
  return(is_bar_plot & is_flipped)}
}

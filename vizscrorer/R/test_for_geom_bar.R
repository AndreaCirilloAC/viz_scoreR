test_for_geom_bar <- function(plot_object,n_of_layers){
  !is.na(match("GeomBar",geoms_lister(plot_object,n_of_layers)))
}

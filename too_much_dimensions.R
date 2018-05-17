too_much_dimensions <- function(plot_object,n_of_layers){
# we check here if there is a combination of geom_point/ geom_line and mapping = size

point_or_line <- match(c("GeomLine", "GeomPoint"),geoms_lister(plot_object,n_of_layers)) %>% 
  sum(na.rm = TRUE)>0
mapped_on_size <- match("size",
                        mappings_lister(plot_object,n_of_layers) )>0
return(point_or_line & mapped_on_size)

}

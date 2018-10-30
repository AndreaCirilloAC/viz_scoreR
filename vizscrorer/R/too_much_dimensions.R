too_much_dimensions <- function(plot_object,n_of_layers){
# we check here if there is a combination of geom_point/ geom_line and mapping = size

not_point_or_line <- match(c("GeomLine", "GeomPoint"),geoms_lister(plot_object,n_of_layers)) %>% 
  sum(na.rm = TRUE) ==0 
not_mapped_on_size <- match("size",
                        mappings_lister(plot_object,n_of_layers)$aes ) %>% is.na() 
return(!not_point_or_line & !not_mapped_on_size)

}

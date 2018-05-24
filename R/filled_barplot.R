filled_barplot <- function(plot_object,n_of_layers){

is_geom_bar <- match("GeomBar",geoms_lister(plot_object,n_of_layers))>0
    
mappings_lister(plot_object,n_of_layers) %>% 
    select(aes) %>% 
    pull() %>% 
    as.vector()-> aes_vector
  
fill_aes_is_mapped <- !is.na(match("fill",aes_vector))   

if(is_geom_bar & 
   fill_aes_is_mapped == FALSE & 
   is_pie_chart(plot_object, n_of_layers)==FALSE){ # we control for being a pie chart
  TRUE
}else{if(is_geom_bar == FALSE){NA}
  else{FALSE}}
}

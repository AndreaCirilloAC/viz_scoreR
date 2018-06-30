filled_barplot <- function(plot_object,n_of_layers){

is_geom_bar <- test_for_geom_bar(plot_object,n_of_layers)
    
mappings_lister(plot_object,n_of_layers) %>% 
    select(aes) %>% 
    pull() %>% 
    as.vector()-> aes_vector
  
fill_aes_is_mapped <- !is.na(match("fill",aes_vector))   

a_pie_chart <- is_pie_chart(plot_object, n_of_layers)

if(is_geom_bar & 
   fill_aes_is_mapped == FALSE & 
   a_pie_chart==FALSE){ # we control for being a pie chart
  TRUE
}else{if(is_geom_bar == FALSE){FALSE}#NA}
  else{FALSE}}
}

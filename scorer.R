
# create data frame to be used to store results of every rating module

check_results <- list(area = c(), 
                      check = c(), 
                      result = c(),
                      additional_data = list())

tester_vector <- function(area_label, topic_label, test, additional_data){
  
vector <-   c( area_label,
     topic_label,
     test,
     additional_data)
  
check_results <- rbind(check_results,vector)
}

geoms_lister <- function(plot_oject, n_of_layers){
geoms_in_plot <- c()
for(i in 1:n_of_layers){  
  
  class_list <- plot_object$layers[[i]]$geom %>% class() %>% as.vector()
  geom <- class_list[1]
  geoms_in_plot <- c(geoms_in_plot,geom)
}
return(geoms_in_plot)
}

n_of_layers <-  plot_object$layers %>% length()



# perform checks for each of the area and principle and assign a score



# MEANINGFULNESS OF THE PLOT

## is a pie chart?

is_pie_chart()

## are there too many layers?

## is the user showing more dimensions than the plot would allow to?

# DATA DENSITY

# DATA TO INK RATIO

# ADEQUATENESS OF LABELLING





# compute the final score

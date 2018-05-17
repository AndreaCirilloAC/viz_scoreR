scorer <- function(plot_object){

  
  # create data frame to be used to store results of every rating module

  check_results <- list(area = c(), 
                        check = c(), 
                        result = c(),
                        additional_data = list())

n_of_layers <-  plot_object$layers %>% length()

area_categories <- c("meaningfulnes of the plot",
                     "data density",
                     "data to ink ratio",
                     "adequateness of labeling")

# perform checks for each of the area and principle and assign a score



# MEANINGFULNESS OF THE PLOT

## is a pie chart?

check_results <- tester_vector(check_results,
                               area_label = area_categories[1],
                               topic_label = "pie_chart",
                               test = is_pie_chart(plot_object, n_of_layers),
                               additional_data = list())

## are there too many layers?

check_results <- tester_vector(check_results,
                               area_label = area_categories[1],
                               topic_label = "number_of_layers",
                               test = n_of_layers>10,
                               additional_data = n_of_layers)

## is the user showing more dimensions than the plot would allow to?

check_results <- tester_vector(check_results,
                               area_label = area_categories[1],
                               topic_label = "number_of_dimensions",
                               test = too_much_dimensions(plot_object,n_of_layers),
                               additional_data= list())

# DATA DENSITY

# DATA TO INK RATIO

# ADEQUATENESS OF LABELLING







return(check_results)}

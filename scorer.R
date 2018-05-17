
# create data frame to be used to store results of every rating module

check_results <- list(area = c(), 
                      check = c(), 
                      result = c(),
                      additional_data = list())

tester_vector <- function(area_label, topic_label, test, additional_data){
  
vector <-   list(area_label,
     topic_label,
     test,
     additional_data)
  
check_results <- rbind(check_results,vector)
return(check_results)
}



n_of_layers <-  plot_object$layers %>% length()

area_categories <- c("meaningfulnes of the plot",
                     "data density",
                     "data to ink ratio",
                     "adequateness of labeling")

# perform checks for each of the area and principle and assign a score



# MEANINGFULNESS OF THE PLOT

## is a pie chart?

check_results <- tester_vector(area_label = area_categories[1],
                               topic_label = "pie chart",
                               test = is_pie_chart(plot_object, n_of_layers),
                               additional_data = list())

## are there too many layers?

#check_results <- tester_vector(area_label = area_ca)

## is the user showing more dimensions than the plot would allow to?

# DATA DENSITY

# DATA TO INK RATIO

# ADEQUATENESS OF LABELLING





# compute the final score

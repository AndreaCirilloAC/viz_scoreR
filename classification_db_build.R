library(cluster) # function daisy
library(dplyr)
library(ggplot2)
library(energy)
## file sourcing to obtain function in the global environment and the final scorer function
scripts <- (paste("R/",list.files("R"),sep =""))
for ( i in 1: length(scripts)){
  source(scripts[i],local = TRUE)
}


plot_list <- list.files("training_plots/")
estimation_db <- data.frame()
colnames_vector <- c( 'plot_name',
                      'pie_chart',
                      'number_of_layers',
                      'number_of_dimensions',
                      'width_of_bins',
                      'flipped_barplot',
                      'need_for_a_smooth',
                      'sufficient_number_of_data',
                      'overplotting',
                      'use_of_heavy_background',
                      'filled_barplot',
                      'presence_of_title',
                      'presence_of_subtitle',
                      'presence_of_caption',
                      'special_characters_in_label',
                      'outliers_not_labelled',
                      'good_plot')

# for each script within the folder we run the code
# run scorer function on the plot
# use the score variable to record if it is a good or poor plot

for (i in 1:length(plot_list)){
  print(plot_list[i])
  source(paste0("training_plots/",plot_list[i]),local = TRUE)
  plot_name <- sub(".R","",plot_list[i])
  plot <- get(plot_name)
  result <- data.frame(scorer(plot))$test %>% as.character()
  row <- data.frame(t(c(plot_list[i],result,score)))
  colnames(row) <- colnames_vector
  estimation_db <- rbind(estimation_db,row)
  colnames(estimation_db) <- colnames_vector
  
  
}








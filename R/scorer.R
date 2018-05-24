scorer <- function(plot_object){

  # preliminary chech on arguments of the function and...
      # ... existance of data ( may be redundant since ggplot already does it)
      # ... 
  
  # if (is.null(geom))
  #   stop("Attempted to create layer with no geom.", call. = FALSE)
  
  # create data frame to be used to store results of every rating module
  
  #constraints: 
    # data must e provided within ggplot() call
    # no overplotting check for histograms ( and generally where no y is provided)
  check_results <- list(area = c(), 
                        check = c(), 
                        result = c(),
                        additional_data = list())

n_of_layers <-  plot_object$layers %>% length()

area_categories <- c("readability of the plot",
                     "data density",
                     "data to ink ratio",
                     "adequateness of labeling")

default_n_of_bins  <- 30 # the default ggplot setting for the number of bins
data_threshold     <- 20 # following tufte we set 20 as threshold to suggest the useR to avoid graphs
overplotting_floor <-  2 # judgmental, based on experience

p_build <- ggplot_build(plot_object)

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

## in case of geom_histogram study the optimal number of bins, employing the Freedman Diaconis rule

check_results <- tester_vector(check_results,
                                  area_label = area_categories[1],
                                  topic_label = "number_of_bins",
                                  test = histogram_bins_tester(plot_object,n_of_layers)[[1]], #true here means we are looking at an histogram
                                  additional_data =histogram_bins_tester(plot_object,n_of_layers)[2:3] )

# DATA DENSITY

## we check here for the user wasting his time developing a graph for less than 20 points to show

check_results <-  tester_vector(check_results,
                                area_label      = area_categories[2],
                                topic_label     = "sufficient_number_of_data",
                                test            = too_few_data(plot_object, data_threshold), #TRUE here means you have enough data
                                additional_data = list ())

## check here for overplotting

check_results <- tester_vector(check_results,
                               area_label = area_categories[2],
                               topic_label = "overplotting",
                               test       = cozy_plot(plot_object, n_of_layers)[[1]], # TRUE here means we are looking at a cozy plot
                               additional_data = cozy_plot(plot_object, n_of_layers)[[2]])

# DATA TO INK RATIO

## check for the use of default theme and by that way the grey background

check_results <- tester_vector(check_results,
                               area_label = area_categories[3],
                               topic_label = "use_of_grey_background",
                               test = heavy_background(plot_object),
                               additional_data = list()) #TRUE here means we are looking at an heavy background, either being one set from the user or the default one ( if still grey)
## check for bar map with full, non white filling not mapped to any aes

check_results <- tester_vector(check_results ,
                               area_label = area_categories[3],
                               topic_label = "filled_barplot",
                               test = filled_barplot(plot_object,n_of_layers),
                               additional_data = list()) #TRUE here means we are looking at an ink-wasting barplot filled with one meaningless colour


# ADEQUATENESS OF LABELLING

##check for presence of descriptive labels: title, subtitle and caption

check_results <- tester_vector(check_results,
                               area_label = area_categories[4],
                               topic_label = "presence_of_title",
                               test = labels_finder(plot_object,"title"), # TRUE here means we found the label
                               additional_data = list())

check_results <- tester_vector(check_results,
                               area_label = area_categories[4],
                               topic_label = "presence_of_subtitle",
                               test = labels_finder(plot_object,"subtitle"), # TRUE here means we found the label
                               additional_data = list())

check_results <- tester_vector(check_results,
                               area_label = area_categories[4],
                               topic_label = "presence_of_caption",
                               test = labels_finder(plot_object,"caption"), # TRUE here means we found the label
                               additional_data = list())

## loook for special characters within labels

check_results <- tester_vector(check_results ,
                               area_label = area_categories[4],
                               topic_label = "special_characters_in_label",
                               test = labels_reader(plot_object)[1],
                               additional_data = labels_reader(plot_object)[2])
## a polished check : we try to understand if there are outliers in data and if they are in some way labeled within the plot

check_results <- tester_vector(check_results,
                               area_label = area_categories[4],
                               topic_label = "outliers_not_labelled",
                               test = outlier_labels(plot_object),
                               additional_data = list())  #FALSE here means we have outliers not labelled

return(check_results)}

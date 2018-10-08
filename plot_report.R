#' ---
#' title: "your plot meta analysis"
#' author: "your buddy viz score bot"
#' output: slidy_presentation
#'    
#' ---


#' <div class="centered">
#' your plot looks 
#' 
{{judgment}}

#' </div>


#' ---
#' <div class="centered">
#' let me tell you a bit more about this
#' 

#' </div>
#'

#' ---
#' 
#' as far as I can see the data viz area in which your plot 
#' scored worst was the {{worst_area}}  

#'

#' ---
#' 
#' <div class="centered">
#' here it is a summary of your plot performance for each area. 
#' 
{{kable(positive_ratio_db)}}  
#' you can look into my documentation to learn which test were performed and how the scores were computed.
#' you can also find more info about all of this here: andreacirillo.com/viz_bot 

#' </div>
#'

#' ---
#' 
#' <div class="centered">
#' is now time to learn how to make your plot more effective applying dataviz principles

#' </div>
#'

#' ---
#' 
#' <div class="centered">
#' I will  give you an advice on how to fix your plot for each test failed

#' </div>
#'

#' ---
#' 


#' <div class='centered'>
#' number_of_bins
#'
#'   you histogram is not the best possibile visualisation of your data. I have found that setting bins to XX produces a better visualisation of data structure.
#' </div>
#'
 
#' ---
#'
#' <div class='centered'>
#' flipped_barplot
#'
#'  humans are better at comparing lengths when showed horizontally. Unless you are showing time-related information (i.e. time series over the x axis) try to flip your bars adding coord_flip() to your plot specification.
#' </div>
#'
 
#' ---
#'
#' <div class='centered'>
#' use_of_heavy_background
#'
#'  you are employing the default ggplot theme. while it is generally fit for its purpose, you should consider removing that grey background, which lowers your data to ink ratio
#' </div>
#'
 
#' ---
#'
#' <div class='centered'>
#' presence_of_title
#'
#'  your plot is missing a title. this make harder for your reader to understand its content. Try to add a plot employing labs(title = “your title”)
#' </div>
#'
 
#' ---
#'
#' <div class='centered'>
#' presence_of_subtitle
#'
#'  your plot is missing a subtitle. subtitle are effective in providing additional relevant info about metrics and data showed in your plot. Try to add a plot employing labs(subtitle = “your subtitle”)
#' </div>
#'
 
#' ---
#'
#' <div class='centered'>
#' presence_of_caption
#'
#'  your plot is missing a caption. While not mandatory, caption are used to provide info about sources and reference period of your plot. This is crucial to increase the level of graphical integrity of your plot. Try to add a plot employing labs(caption = “your subtitle”)
#' </div>
#'
 
#' ---
#'
#' <div class='centered'>
#' outliers_not_labelled
#'
#'  I have found some outliers in your data, and they do not seem to be explicitly labeled in your plot. To increase the level of meaningfulness you should consider labelling them. 
#' </div>
#'
 
#' ---
#'

#' ---
#' title: "your plot meta analysis"
#' author: "your buddy viz score bot"
#' output:
#'   slidy_presentation:
#'   font_adjustment: +10
#'   footer: "Copyright (c) 2018, Andrea Cirillo"
#'   incremental: true
#'    
#' ---

#' ---
  
#+ r, echo=FALSE
htmltools::includeCSS("blinking.css")


  
#' <div class="centered">
#' your plot looks 
{{judgment}}  
{{htmltools::includeHTML("test.html")}} 
#' </div>
#'

#' ---
#' 
#' #' <div class="centered">
#' let me tell you a bit more about this
{{htmltools::includeHTML("test.html")}} 
#' </div>
#'

#' ---
#' 
#' #' <div class="centered">
#' as far as I can see the data viz area in which your plot scored worst was the
{{worst_area}}  
{{htmltools::includeHTML("test.html")}} 
#' </div>
#'

#' ---
#' 
#' #' <div class="centered">
#' here it is a summary of your plot performance for each area. 
{{kable(positive_ratio_db)}}  
#' you can look into my documentation to learn which test were performed and how the scores were computed.
#' you can also find more info about all of this here: andreacirillo.com/viz_bot 
{{htmltools::includeHTML("test.html")}} 
#' </div>
#'

#' ---
#' 
#' <div class="centered">
#' is now time to learn how to make your plot more effective applying dataviz principles
{{htmltools::includeHTML("test.html")}} 
#' </div>
#'

#' ---
#' 
#' <div class="centered">
#' I will  give you an advice on how to fix your plot for each test failed
{{htmltools::includeHTML("test.html")}} 
#' </div>
#'

#' ---
#' 
#' <div class="centered">

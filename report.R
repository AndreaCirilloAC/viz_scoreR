#' ---
#' title: "your plot meta analysis"
#' author: "your buddy viz score bot"
#' output:
#'   slidy_presentation:
#'   font_adjustment: +10
#'   footer: "Copyright (c) 2018, Andrea Cirillo"
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
#' as far as I can see the data viz area in which your plot scored worst was
{{worst_area}}  
{{htmltools::includeHTML("test.html")}} 
#' </div>
#'

#' ---


scorer_bot <- function(plot_object = NULL){
  plot_metadata <- metadata_reader(plot_object)
  score <- scorer(plot_metadata)
  rmarkdown::render("report.R")
  system("open report.html")
  
  score_map <- data.frame(lower = c(0,0.11,0.41,0.71),
                          upper = c(0.10,0.40,0.70,1),
                          judgment = c("poorly _", "improvable _","good! _", "great! _"))
  score_map$score_match <- mapply(between,
                                  x = rep(score,nrow(score_map)), 
                                  left = data$lower,
                                  right = data$upper,
                                  SIMPLIFY = TRUE);score_map %>% 
    filter(score_match == TRUE) %>% 
    select(judgment) %>% pull() %>% 
    as.character() -> judgment
  
}

scorer_bot(flowers)

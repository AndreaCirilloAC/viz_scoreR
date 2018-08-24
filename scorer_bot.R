scorer_bot <- function(plot_object = NULL){
  multplying_vector <- c()
  metadata_reader(plot_object) %>% 
    mutate() #add a column showing TRUE for positive outcome of the test
  score <- scorer(plot_metadata)
  score_map <- data.frame(lower = c(0,0.11,0.41,0.71),
                          upper = c(0.10,0.40,0.70,1),
                          judgment = c("poorly", "improvable","good!", "great!"))

  score_map$score_match <- mapply(between,
                                  x = rep(score,nrow(score_map)), 
                                  left = score_map$lower,
                                  right = score_map$upper,
                                  SIMPLIFY = TRUE)
  score_map %>% 
    filter(score_match == TRUE) %>% 
    select(judgment) %>% pull() %>% 
    as.character() -> judgment
  print(judgment)
  rmarkdown::render("report.R")
  system("open report.html")

  # from metadata, leveraging area_label and ispositive attribute, we highligh which area of dataviz
  # shows problem for the plot
  # we will highlight those area to our user
  
  
  # we then select the specific test showing problems, so to give specific advice for each of this elements.
  
  # 
    
}

scorer_bot(flowers)

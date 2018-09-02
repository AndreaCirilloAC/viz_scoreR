scorer_bot <- function(plot_object = NULL){
 plot_metadata_raw <- metadata_reader(plot_object) %>% as.data.frame()
 plot_metadata <- data.frame(area_label = unlist(plot_metadata_raw$area_label),
                             topic_label = unlist(plot_metadata_raw$topic_label),
                             test        = unlist(plot_metadata_raw$test),
                             ispositive = unlist(plot_metadata_raw$ispositive))
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



  # from metadata, leveraging area_label and ispositive attribute, we highligh which area of dataviz
  # shows problem for the plot
  # we will highlight those area to our user
  
  plot_metadata %>% 
    select(area_label,ispositive) %>% 
    group_by(area_label,ispositive) %>% 
    count() %>% 
    spread(key = ispositive, value = n) %>% 
    mutate(positive_ratio = `TRUE`/sum(`TRUE`,`FALSE`, na.rm = TRUE)) %>% 
    rename(passed = `TRUE`,failed = `FALSE`) %>% 
    mutate(total = sum(passed , failed,na.rm = TRUE)) -> positive_ratio_db
  
  positive_ratio_db %>% 
    filter(positive_ratio == min(.$positive_ratio)) %>% 
    select(area_label) %>% 
    pull() %>% 
    as.character() -> worst_area # the worst area was the one in which the plot obtained ther worst positive rate,
  #i.e. number of positive results in test given the overall number of test for that area.
 
  # we then select each specific test showing problems, so to give specific advice for each of this elements.
  plot_metadata %>% 
    select(topic_label,ispositive) %>% 
    filter(ispositive == FALSE) -> errors_db
  
  # merge errors_db with a db storing a suggestion for each possible error
  advices_db <- read.csv("plot_advices.csv", sep = ";", stringsAsFactors = FALSE)
  
  errors_db %>% 
    left_join(.,advices_db,by = "topic_label") -> teaching_db

n_of_errors <- nrow(errors_db)
 
file.copy("report.R", to = "plot_report.R",overwrite = TRUE)

for (i in 1:n_of_errors){


  write("#' <div class='centered'>", file = "plot_report.R", append = TRUE)
  write(paste0("#' ",teaching_db[i,1]), file = "plot_report.R", append = TRUE)
  write("#'", file = "plot_report.R", append = TRUE)
  write(paste0("#' ",teaching_db[i,3]), file = "plot_report.R", append = TRUE)
  write("{{htmltools::includeHTML('test.html')}} ", file = "plot_report.R", append = TRUE)
  write("#' </div>", file = "plot_report.R", append = TRUE)
  write("#'", file = "plot_report.R", append = TRUE)
  write(" ", file = "plot_report.R", append = TRUE)
  write( "#' ---",file = "plot_report.R", append = TRUE)
  write("#'", file = "plot_report.R", append = TRUE)
  
}




  rmarkdown::render("plot_report.R")
  system("open plot_report.html")
    
}

 scorer_bot(a_good_theme_a_bad_pie)

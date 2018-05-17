tester_vector <- function(area_label, topic_label, test, additional_data){
  
  vector <-   list(area_label,
                   topic_label,
                   test,
                   additional_data)
  
  check_results <- rbind(check_results,vector)
  return(check_results)
}

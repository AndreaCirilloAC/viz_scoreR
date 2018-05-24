tester_vector <- function(check_results,area_label, topic_label, test, additional_data){
  
  vector <-   c(area_label,
                   topic_label,
                   test,
                   additional_data)
  
  check_results <- rbind(check_results,vector)
  return(check_results)
}

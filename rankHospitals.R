rankall <- function(p_outcome, num="best") {
  outcome <- read.csv("outcome-of-care-measures.csv", header=TRUE, na.strings = "Not Available")
  hospitaldf <- data.frame(Hospital.Name=as.character(), State=as.character())
  states_list <- unique(outcome$State)
  states_list <- states_list[order(states_list)]
  outcome_types <- c("heart attack", "heart failure","pneumonia")
  for (state in states_list) {
    hospital <- rankhospital(state, p_outcome, num)
    hospitaldf <- rbind(hospitaldf, data.frame(hospital, state))
  }
  hospitaldf
}

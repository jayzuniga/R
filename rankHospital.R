rankhospital <- function(state, p_outcome, num = "best") {
  outcome <- read.csv("outcome-of-care-measures.csv", header=TRUE, na.strings="Not Available")
  hospital <- "NA"
  rank <- 1
  states_list <- unique(outcome$State)
  outcome_types <- c("heart attack", "heart failure","pneumonia")
  if (!(is.element(state, states_list))) {stop("Invalid State!!!")}	
  if (!(is.element(p_outcome, outcome_types))) {stop("Invalid Outcome!!!")}
  if (p_outcome == "heart attack") {
    outcome_tab <- data.frame(Hospital.Name=outcome$Hospital.Name,
                              State=outcome$State,
                              Rate=outcome$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack)
    outcome_tab <- outcome_tab[complete.cases(outcome_tab),]
    outcome_tab <- outcome_tab[outcome_tab$State == state, ]
    outcome_tab <- outcome_tab[order(outcome_tab$Rate, outcome_tab$Hospital.Name),]
  }
  if (p_outcome == "heart failure") {
    outcome_tab <- data.frame(Hospital.Name=outcome$Hospital.Name,
                              State=outcome$State,
                              Rate=outcome$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure)
    outcome_tab <- outcome_tab[complete.cases(outcome_tab),]
    outcome_tab <- outcome_tab[outcome_tab$State == state, ]
    outcome_tab <- outcome_tab[order(outcome_tab$Rate, outcome_tab$Hospital.Name),]
  }
  if (p_outcome == "pneumonia") {
    outcome_tab <- data.frame(Hospital.Name=outcome$Hospital.Name,
                              State=outcome$State,
                              Rate=outcome$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia)
    outcome_tab <- outcome_tab[complete.cases(outcome_tab),]
    outcome_tab <- outcome_tab[outcome_tab$State == state, ]
    outcome_tab <- outcome_tab[order(outcome_tab$Rate, outcome_tab$Hospital.Name),]
  }
    if (num == "best") {rank <- 1}
    else if (num == "worst") {rank <- nrow(outcome_tab)}
    else if (num > nrow(outcome_tab)) {rank <- 0}
    else {rank <- num}
    if (rank != 0) { 
      hospital <- as.vector(outcome_tab[rank,c("Hospital.Name")])
      }
    else { hospital <- "NA"}
  hospital
}

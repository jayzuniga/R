best <- function(state, p_outcome) {
	## Read outcome data
	outcome <- read.csv("outcome-of-care-measures.csv", header=TRUE)
	## Check that state and outcome are valid
	states_list <- unique(outcome$State)
	outcome_types <- c("heart attack", "heart failure","pneumonia")
	if (!(is.element(state, states_list))) {stop("Invalid State!!!")}	
	if (!(is.element(p_outcome, outcome_types))) {stop("Invalid Outcome!!!")}
	if (p_outcome == "heart attack") {
		outcome_tab <- data.frame(outcome$Hospital.Name,
								outcome$State,
		                          outcome$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack)
    outcome_tab <- outcome_tab[outcome_tab$outcome.Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack != "Not Available",]
    outcome_tab <- outcome_tab[outcome_tab$outcome.State == state, ]
    outcome_tab <- outcome_tab[order(outcome_tab$outcome.Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack,
                                    outcome_tab$outcome.Hospital.Name),]
		}
  if (p_outcome == "heart failure") {
    outcome_tab <- data.frame(outcome$Hospital.Name, outcome$State,
                              outcome$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure)
    outcome_tab <- outcome_tab[outcome_tab$outcome.Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure != "Not Available",]
    outcome_tab <- outcome_tab[outcome_tab$outcome.State == state, ]
    outcome_tab <- outcome_tab[order(outcome_tab$outcome.Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure,
                                     outcome_tab$outcome.Hospital.Name),]
  }
	if (p_outcome == "pneumonia") {
	  outcome_tab <- data.frame(outcome$Hospital.Name, outcome$State,
	                            outcome$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia)
	  outcome_tab <- outcome_tab[outcome_tab$outcome.Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia != "Not Available",]
	  outcome_tab <- outcome_tab[outcome_tab$outcome.State == state, ]
	  outcome_tab <- outcome_tab[order(outcome_tab$outcome.Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia,
	                                   outcome_tab$outcome.Hospital.Name),]
	}
  ##best_hospital <- as.vector(outcome_tab[c(1:100),c("outcome.Hospital.Name","outcome.Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia")])
	best_hospital <- as.vector(outcome_tab[c(162),c("outcome.Hospital.Name")])
  best_hospital
  
	}

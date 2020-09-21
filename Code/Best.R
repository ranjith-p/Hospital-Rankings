best <- function(state,outcome){
  
  ## Read outcome data
  r <- read.csv("outcome-of-care-measures.csv")
  
  ## Changing the class because default class is "Character"
  suppressWarnings({
  r[,17] <- as.numeric(r[,17])
  r[,23] <- as.numeric(r[,23])
  r[,11] <- as.numeric(r[,11])})
  
  #Splitting by state
  by_states <- split(r,r$State)
  
  ## Check that state and outcome are valid if not stop with an error message
  if(!(outcome %in% list("pneumonia","heart failure","heart attack"))){
      stop("invalid outcome")
  }
  if(!(state %in% r[,7])){
      stop("invalid state")
  }
  
  ## Find best hospital for Heart-Attack in the given state
  if(outcome=="heart attack"){
      state_given <- by_states[[state]]
      result <- state_given[order(state_given$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack),]
      hospital_name <- result[1,2]
  }
  
  ## Find best hospital  for Heart-Failure in the given state
  if(outcome=="heart failure"){
     state_given <- by_states[[state]]
     result <- state_given[order(state_given$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure),]
     hospital_name <- result[1,2]
  }
  
  ## Find best hospital for Pneumonia in the given state
  if(outcome=="pneumonia"){
     state_given <- by_states[[state]]
     result <- state_given[order(state_given$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia),]
     hospital_name <- result[1,2]
    
  }
  return(hospital_name)
  
}

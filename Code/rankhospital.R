rankhospital <- function(state, outcome, num = "best") {
  ## Read outcome data
  r <- read.csv("outcome-of-care-measures.csv")
  
  ## Changing the class because default class is "Character"
  r[,17] <- as.numeric(r[,17])
  r[,23] <- as.numeric(r[,23])
  r[,11] <- as.numeric(r[,11])
  
  #Splitting by state
  by_states <- split(r,r$State)
  
  ## Check that state and outcome are valid if not stop with an error message
  if(!(outcome %in% list("pneumonia","heart failure","heart attack"))){
      stop("invalid outcome")
  }
  
  if(!(state %in% r[,7])){
      stop("invalid state")
    
  }
  
  ## Return hospital name in that state with the given rank for Heart-Attack
  if(outcome=="heart attack"){
      state_given <- by_states[[state]]
      result <- state_given[order(state_given[,11], state_given$Hospital.Name,na.last = NA),]
      if(num == "best"){ num = 1}
      if(num == "worst"){ num = length(result[,11])}
      hospital_name <- result[num,2]

  }
  
  ## Return hospital name in that state with the given rank for Heart-Failure
  if(outcome=="heart failure"){
      state_given <- by_states[[state]]
      result <- state_given[order(state_given[,17],state_given$Hospital.Name, na.last =NA),]
      if(num == "best"){ num = 1}
      if(num == "worst"){ num = length(result[,17])}
      hospital_name <- result[num,2]
    
  }
  
  ## Return hospital name in that state with the given rank for Pneumonia
  if(outcome=="pneumonia"){
      state_given <- by_states[[state]]
      result <- state_given[order(state_given[,23],state_given$Hospital.Name, na.last =NA),]
      if(num == "best"){ num = 1}
      if(num == "worst"){ num = length(result[,23])}
      hospital_name <- result[num,2]
    
  }

  return(hospital_name)
}


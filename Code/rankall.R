rankall <- function(outcome, num = "best") {
  ## Read outcome data
  r <- read.csv("outcome-of-care-measures.csv")
  
  ## Changing the class because default class is "Character"
  r[,17] <- as.numeric(r[,17])
  r[,23] <- as.numeric(r[,23])
  r[,11] <- as.numeric(r[,11])
  
  ## Splitting by state 
  by_states <- split(r,r$State)
  
  ## Collecting names of states
  all_states <- r$State
  all_states <- unique(all_states)
  
  
  ## Check that state and outcome are valid if not stop with an error message
  if(!(outcome %in% list("pneumonia","heart failure","heart attack"))){
      stop("invalid outcome")
  }
   
  ## Empty vector for storing hospital names and states
  hospital_names = character()
  state_names = character()
  
  
  ## For each state, find the hospital of the given rank for Heart-Attack
  if(outcome=="heart attack"){
      for (state in all_states) {
         state_given <- by_states[[state]]
         result <- state_given[order(state_given[,11], state_given$Hospital.Name,na.last = NA),]
         if(num == "best"){ num = 1}
         if(num == "worst"){ num = length(result[,11])}
         hospital_names <- c(hospital_names,result[num,2])
         state_names <- c(state_names,state)
    
         ## Creating data frame of the result
         data_frame <-data.frame(hospital = hospital_names,state =state_names,row.names = state_names)
         data_frame <- data_frame[order(data_frame[,2],data_frame$state),]
  
      }
  }
  ## For each state, find the hospital of the given rank for Heart-Failure
  if(outcome=="heart failure"){
      for (state in all_states) {
         state_given <- by_states[[state]]
         result <- state_given[order(state_given[,17], state_given$Hospital.Name,na.last = NA),]
         if(num == "best"){ num = 1}
         if(num == "worst"){ num = length(result[,17])}
         hospital_names <- c(hospital_names,result[num,2])
         state_names <- c(state_names,state)
        
         ## Creating data frame of the result
         data_frame <-data.frame(hospital = hospital_names,state =state_names,row.names = state_names)
         data_frame <- data_frame[order(data_frame[,2],data_frame$state),]
    
      }
  }
    
  ## For each state, find the hospital of the given rank for Pneumonia 
  if(outcome=="pneumonia"){
      for (state in all_states) {
         state_given <- by_states[[state]]
         result <- state_given[order(state_given[,23], state_given$Hospital.Name,na.last = NA),]
         if(num == "best"){ num = 1}
         if(num == "worst"){ num = length(result[,23])}
         hospital_names <- c(hospital_names,result[num,2])
         state_names <- c(state_names,state)
         print(hospital_names)
        
         ## Creating data frame of the result
         data_frame <-data.frame(hospital = hospital_names,state =state_names,row.names = state_names)
         data_frame <- data_frame[order(data_frame[,2],data_frame$state),]
      }
    
   } 
 
   return(data_frame)

}

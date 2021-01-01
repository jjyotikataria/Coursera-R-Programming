rankall <- function(outcome, num = "best") {
    
    
    outcomes <- read.csv("outcome-of-care-measures.csv", colClasses = "character", header = TRUE)  ## Reading outcome data
    
    data <- file[c(2,7,11,17,23)]       ## Getting just the data we want
    
    colnames(data) <- c("hospital", "state", "heart attack", "heart failure", "pneumonia")
    
    if(!outcome %in% c("heart attack", "heart failure", "pneumonia")){
        stop('invalid outcome')
    }
    
    hRank <- data.frame()
    
    for(state in sort(unique(data[,"state"]))){
      
        hRates <- data[(data[, "state"] == state), ]              ## Get only the hospitals in this state
        
        hRates[, outcome] <- as.numeric(hRates[, outcome])        ## Convert outcome rate to numeric
        
        hRates <- hRates[!is.na(hRates[, outcome]), ]             ## Removing NA
  
        if(num == "best") {                                       ## convert num argument to valid rank
            rnum <- 1 
        } else if (num == "worst") {
            rnum <- nrow(hRates) 
        }
        else {rnum = num}
       
        hRates <- hRates[order(hRates[, outcome], hRates[, "hospital"]), ]          ## Order by outcome rate & hospital name
        
        hName <- hRates[rnum,1]
        
        hRank <- rbind(hRank,
                       data.frame(hospital = hName,
                                  state = state))
    }
    
    hRank                 ## Return the desired dataframe for the solution

    
}

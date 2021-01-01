rankall <- function(outcome, num = "best"){
    
    file <- read.csv("outcome-of-care-measures.csv", header = TRUE, colClasses = "character")
    
    data <- file[c(2,7,11,17,23)]
    
    if(!outcome %in% c("heart attack","heart failure","pneumonia")){
        stop("Invalid outcome")
    }
    
    
    empty_df <- data.frame()
    
    for(state in sort(unique(data[, "state"]))){                    
        
        data <- data[(data[, "state"] == state), ]              
        data[, outcome] <- as.numeric(data[, outcome])
        data <- data[!is.na(data[, outcome]),]
        
        if(num == "best"){
            rnum <- 1
        } else if (num == "worst"){
            rnum <- nrow(data)
            
        }
        else {rnum = num}
        
        
        
    }
    
    
}

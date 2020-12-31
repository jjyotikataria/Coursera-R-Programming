best <- function(state, outcome){
    
    file <- read.csv("outcome-of-care-measures.csv", header = TRUE, colClasses = "character")
    
    data <- file[,c(2,7,11,17,23)]
    colnames(data) <- c("hospital name","state","heart attack","heart failure","pneumonia")
    
    if(!state %in% data[,"state"]){
        stop("Invalid state")
    }
    
    if(!outcome %in% c("heart attack","heart failure","pneumonia")){
        stop("Invalid outcome")
    }
    
    data <- data[(data[, "state"] == state), ]              ## we can check if we just got that state or not by unique(data["state"])
    data[, outcome] <- suppressWarnings(as.numeric(data[, outcome]))
    data <- data[!is.na(data[, outcome]), ]
    data <- data[order(data[, outcome]), ]
    names <- data[data[, outcome] == min(data[, outcome]),1]
    sort(names)[1]   
 
    } 

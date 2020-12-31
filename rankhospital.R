rankhospital <- function(state, outcome, num = "best"){
    
    file <- read.csv("outcome-of-care-measures.csv", header = TRUE, colClasses = "character")
    
    data <- file[c(2,7,11,17,23)]
    colnames(data) <- c("hospital name","state","heart attack","heart failure","pneumonia")
    
    if(!state %in% data[,"state"]){
        stop("Invalid state")
    }
    
    if(!outcome %in% c("heart attack","heart failure","pneumonia")){
        stop("Invalid outcome")
    }
    
    data <- data[(data[, "state"] == state), ]
    data[, outcome] <- as.numeric(data[, outcome])
    data <- data[!is.na(data[, outcome]),]
    
    if(num == "best") {
        num <- 1 
    }
    if (num == "worst") {
        num <- nrow(order) 
    }
    
    order <- data[order(data[, outcome], data[, "hospital name"]), ]
    order[num, 1]

} 

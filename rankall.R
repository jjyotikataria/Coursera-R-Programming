rankall <- function(outcome, num = "best"){
    
    file <- read.csv("outcome-of-care-measures.csv", header = TRUE, colClasses = "character")
    
    data <- file[c(2,7,11,17,23)]
    
    if(!outcome %in% c("heart attack","heart failure","pneumonia")){
        stop("Invalid outcome")
    }
    
                                      ## Getting names of unique state names : sort(unique(data[, "state"]))
                                      ## Getting number of unique states : length(sort(unique(data[, "state"])))
    empty_df <- data.frame()
    
    
    
}

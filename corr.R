corr <- function(directory, threshold = 0){
    
    # Create empty data frame
    correlation <- numeric(0)
    
    nobsComplete <- complete(directory)
    
    nobsComplete <- nobsComplete[nobsComplete$nobs > threshold,]

    for(num in nobsComplete$id){
      if(num < 10){
        file <- paste(getwd(), "/", directory, "/00", num, ".csv", sep="")
      } else if(num > 9 && num < 100){
        file <- paste(getwd(), '/', directory, "/0", num, ".csv", sep="")
      } else{
        file <- paste(getwd(), "/", directory, "/", num, ".csv", sep="")
      }
      pollutant_data <- read.csv(file=file, header=TRUE, sep=",")
      correlation <- c(correlation, cor(pollutant_data$sulfate, pollutant_data$nitrate, use="pairwise.complete.obs"))
    }
    correlation
}
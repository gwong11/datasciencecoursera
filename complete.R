complete <- function(directory, id = 1:332){
    
    # Create empty data frame
    pollutant_complete <- data.frame()
    #print(id)
    # read in the csv files
    for(num in id){
      if(num < 10){
        file <- paste(getwd(), "/", directory, "/00", num, ".csv", sep="")
      } else if(num > 9 && num < 100){
        file <- paste(getwd(), '/', directory, "/0", num, ".csv", sep="")
      } else{
        file <- paste(getwd(), "/", directory, "/", num, ".csv", sep="")
      }
      pollutant_data <- read.csv(file=file, header=TRUE, sep=",")
      nobs = sum(!is.na(pollutant_data[2]) & !is.na(pollutant_data[3]))
      #nobs2 = sum(!is.na(pollutant_data[3]))
      #print(nobs)
      pollutant_complete <- rbind(pollutant_complete, c(num, nobs))
    }
    colnames(pollutant_complete) <- c("id", "nobs")
    pollutant_complete
    
}
pollutantmean <- function(directory, pollutant, id = 1:332) {
    
    # Create empty data frame
    pollutant_complete <- data.frame()
    
    if(pollutant == 'sulfate'){
      index <- 2
    } else if(pollutant == 'nitrate'){
      index <- 3
    }
    
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
      pollutant_complete <- rbind(pollutant_complete, pollutant_data)
    }
    pollutant_means = colMeans(pollutant_complete[index], na.rm=TRUE, dims=1)
    pollutant_means
}




dir <- "/home/wayne/Documents/Code/R/specdata/"
pollutant <- "nitrate"
id <- 1:332

format <- function(x) {
  
  if (nchar(x) == 1){
    return (paste("00",x,sep=""))
  }
  if (nchar(x) == 2) {
    
    return (paste("0",x,sep=""))
  }
  if (nchar(x) == 3) {
    
    return (paste("",x,sep=""))
  }
}


pollutantmean <- function(dir,pollutant, id=1:332) {
  
 
  totalRows <- 0
  totalTotal <- 0
  
  for (i in id) {
    
    data <- read.csv(file=paste(dir,format(i),".csv",sep=""),header=TRUE,sep=",")
    
    data2 <- data.frame(data[complete.cases(data),])
    rows <- nrow(data2)
    
    if (pollutant == "sulfate") {total <- sum(data2$sulfate)}
    if (pollutant == "nitrate") {total <- sum(data2$nitrate)}
    
    totalRows <- totalRows + rows
    totalTotal <- total + totalTotal
    
    
 
    
  }
    totalmean <- totalTotal/totalRows
  
    print(paste("Mean of ",pollutant," is ",totalmean,sep=""))
  
  
}
pollutantmean(dir,pollutant, id )



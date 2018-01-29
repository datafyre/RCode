

dir <- "/home/wayne/Documents/Code/R/specdata/"

id <- 332:1

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


corrVector <- numeric()

corr <- function(dir, threshold = 0) {
  
  id <- 1:332
  rows <- 0
  
  for (i in id) {
    
    
    data <- read.csv(file=paste(dir,format(i),".csv",sep=""),header=TRUE,sep=",")
    
    data2 <- data.frame(data[complete.cases(data),])
    rows <- nrow(data2)
    
    if (rows > threshold) {
      
      correlation <- cor(data2[,2], data2[,3], method="pearson" )
      corrVector <- c(corrVector,correlation)
    
  
  }  
  
    
  
  }#end for loop
  corrVector
}


cr <- corr(dir, 2000)
n <- length(cr)                
cr <- corr(dir, 1000)                
cr <- sort(cr)
print(c(n, round(cr, 4)))
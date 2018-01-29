

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

col1 <-  character()
col2 <- numeric()

complete <- function(dir, id) {
  
 
  
  for (i in id) {
    
    
    data <- read.csv(file=paste(dir,format(i),".csv",sep=""),header=TRUE,sep=",")
    
    data2 <- data.frame(data[complete.cases(data),])
    rows <- nrow(data2)
    
    
    col1 <- c(col1,i)
    col2 <- c(col2,rows)
    
    print(paste(i,rows,sep=" "))
  
  }
    
    
    #df <- data.frame(col1,col2, stringsAsFactors = FALSE)
    
    require(reshape2)
    df <- melt(data.frame(col1,col2))
    colnames(df) <- c("id","nobs")
    print(df)
    
}
      
   # complete(dir,id)
    set.seed(42)
    cc <- complete(dir, 332:1)
    use <- sample(332, 10)
    print(cc[use, 3 ])



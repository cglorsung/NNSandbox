
# Supervise the learning?
supervise = TRUE

# Number of iterations
iterations = 10000

# Read data file
fileData <- read.csv("Data/SampleGenes.csv", header=FALSE)

scaled.fileData <- scale(fileData)

# Figure out how to scale this properly and get it into a matrix
normal.fileData <- as.matrix(fileData / norm(as.matrix(fileData), type="F"))

mat.fileData <- matrix(normal.fileData, nrow(normal.fileData), ncol(normal.fileData))

print(normal.fileData[1,1])

# Sigmoid function
sigmoid <- function(x, derive=FALSE) {
  if (derive) {
    return (x*(1-x))
  } else {
    return (1/(1+exp(-x)))
  }
}

if(supervise) {
  outArr <- array(c(1,1,1,1,0,0,0,0,0,1,0,1), dim=c(12,1,1))
} else {
  outArr <- array(c(0), dim=c(nrow(scaled.fileData), 1, 1))
}

cat(sprintf("NCOL SC.FD: %s\nNROW SC.FD: %s", ncol(scaled.fileData), nrow(scaled.fileData)))

scfdCol <- ncol(scaled.fileData)
scfdRow <- nrow(scaled.fileData)
totVals <- scfdCol * scfdRow

# Evaluate synapses
syn0 <- matrix(runif(totVals, -1.0, 1.0), scfdCol, scfdRow)
syn1 <- matrix(runif(length(outArr), -1, 1.0), length(outArr), length(outArr[1]))


      
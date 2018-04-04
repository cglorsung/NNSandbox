
# Supervise the learning?
supervise = TRUE

# Number of iterations
iterations = 10000

# Read data file
fileData <- read.csv("Data/SampleGenes.csv", header=FALSE)

scaled.fileData <- scale(fileData)
print(scaled.fileData[1,1:10])

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

print(outArr)

print(ncol(scaled.fileData))

synapse0 <- 2*runif(ncol(scaled.fileData), -1.0, 1.0) - 1

print(synapse0)

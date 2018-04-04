
# Supervise the learning?
supervise = TRUE

# Number of iterations
iterations = 10000

# Read data file
fileData <- read.csv("Data/SampleGenes.csv", header=FALSE)

scaled.fileData <- scale(fileData)

print(scaled.fileData)

# Figure out how to scale this properly and get it into a matrix
scaled.fileData <- matrix(scaled.fileData, ncol=ncol(scaled.fileData), nrow=nrow(scaled.fileData))[1,]

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

# Evaluate synapses

# Figure out how to get this synapse working properly
syn0 <- matrix(2*runif(ncol(scaled.fileData)*nrow(scaled.fileData), 0, 1)-1, ncol=nrow(scaled.fileData), nrow=ncol(scaled.fileData))

print(syn0[0,])

cat(sprintf("NCOL SYN0: %s\nNROW SYN1: %s", ncol(syn0), nrow(syn0)))

# Dimensions don't work
print(sigmoid(scaled.fileData%*%syn0))

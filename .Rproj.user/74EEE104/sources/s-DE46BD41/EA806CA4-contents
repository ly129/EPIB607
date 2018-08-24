## ------------------------------------------------------------------------
a <- c(1,2,3)
b <- c(1,2,3)
a+b

## ------------------------------------------------------------------------

# generate a sequence of numbers from 1 to 10
(a <- 1:10)

# sum the numbers from 1 to 10
sum(a)

# calculate sums of each column
colSums(iris[, -5])


## ------------------------------------------------------------------------

# Getting the row means of two columns
# Generate data
N <- 10000
x1 <- runif(N)
x2 <- runif(N)
d <- as.data.frame(cbind(x1, x2))
head(d)

# Loop:
# create a vector to store the results in 
rowMeanFor <- vector("double", N)

for (i in seq_len(N)) {
        rowMeanFor[[i]] <- mean(c(d[i, 1], d[i, 2]))
}

# Apply:
rowMeanApply <- apply(d, 1, mean)

# are the results equal
all.equal(rowMeanFor,rowMeanApply)


## ------------------------------------------------------------------------
data(women)
# data structure
str(women)

# calculate the mean for each column
apply(women, 2, mean)

# apply 'fivenum' function to each column
vapply(women, fivenum, c("Min." = 0, "1st Qu." = 0, "Median" = 0, 
                         "3rd Qu." = 0, "Max." = 0))

## ------------------------------------------------------------------------
# the ouput of sapply is a vector
# the 's' in sapply stands for 'simplified' apply
mtcars$gear2 <- sapply(mtcars$gear, 
                       function(i) if (i==4) "alot" else "some")

head(mtcars)[,c("gear","gear2")]

## ------------------------------------------------------------------------

# Fisher's famous dataset 
data(iris)
str(iris)

# mean sepal length by species 
tapply(iris$Sepal.Length, iris$Species, mean)

## ------------------------------------------------------------------------
v1 <- rnorm(100, mean = 5, sd = 1)
v2 <- rnorm(100, mean = 10, sd = 5)
v3 <- rnorm(100, mean = -3, sd = 10)

## ------------------------------------------------------------------------
means <- c(5,10,-3) ; sds <- c(1,5,10) 

# MoreArgs is a list of arguments that dont change
randomNormals <- mapply(rnorm, mean = means, sd = sds, 
                        MoreArgs = list(n = 100))

head(randomNormals)

## ------------------------------------------------------------------------
simParams <- expand.grid(means = 1:10,
                         sds = 1:10)

randomNormals <- mapply(rnorm, mean = simParams$means, 
                        sd = simParams$sds, 
                        MoreArgs = list(n = 100))

dim(randomNormals)



set.seed(1)
m <- 80 # rows
n <- 200 # columns
# rnorm default is mean = 0, sd = 1
data0 <- replicate(n, rnorm(m))
# use the data e.g. find mean of each column
colMeans(data0)

# some simulated data for example
set.seed(1)
data1 <- rnorm(8, mean = 1, sd = 0.3)
data2 <- rnorm(8, mean = 3, sd = 0.9)
# data1 is control, data2 is drug-treated
t.test(data1,data2)
# For paired data, use the additional parameter.
t.test(data1,data2,paired=TRUE)
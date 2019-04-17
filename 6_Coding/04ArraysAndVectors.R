# simple example of vectors
x <- c(3, 5, 1, 9, 0)
# print the 3rd element
x[3]
# now assign some random values instead
x <- rnorm(10,10,2)
# sum all except the first item
sum(x[-1])
# run the last two commands again, note the change in value

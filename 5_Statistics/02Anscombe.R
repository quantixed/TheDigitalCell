library(ggplot2)
library(gridExtra)
# load in the data
data(anscombe)
# look at summary statistics, note the similarities
summary(anscombe)
# look at the correlation between x and y pairs
sapply(1:4, function(x) cor(anscombe[, x], anscombe[, x+4]))
# variance in the data is very similar too
sapply(5:8, function(x) var(anscombe[, x]))
# do linear regression on the first pair x1 and y1
lm(y1 ~ x1, data = anscombe)
# shows that intercept is 3 and the slope is 0.5
# check the other data pairs using
# lm(y2 ~ x2, data = anscombe)
# now plot out the data out and look at differences
p1 <- ggplot(anscombe) + geom_point(aes(x1, y1))
p2 <- ggplot(anscombe) + geom_point(aes(x2, y2))
p3 <- ggplot(anscombe) + geom_point(aes(x3, y3))
p4 <- ggplot(anscombe) + geom_point(aes(x4, y4))
# the figure in the book is generated with more complicated code
grid.arrange(p1, p2, p3, p4)
#-----------------------------------------------
p1 <- ggplot(anscombe) + geom_point(aes(x1, y1)) + theme_bw() + scale_x_continuous(breaks = seq(0, 20, 5)) + scale_y_continuous(breaks = seq(0, 20, 5)) + geom_abline(intercept = 3, slope = 0.5, color = "darkgray") + expand_limits(x = c(0,20), y = c(0,20)) + labs(title = "Data set 1")
p2 <- ggplot(anscombe) + geom_point(aes(x2, y2)) + theme_bw() + scale_x_continuous(breaks = seq(0, 20, 5)) + scale_y_continuous(breaks = seq(0, 20, 5)) + geom_abline(intercept = 3, slope = 0.5, color = "darkgray") + expand_limits(x = c(0,20), y = c(0,20)) + labs(title = "Data set 2")
p3 <- ggplot(anscombe) + geom_point(aes(x3, y3)) + theme_bw() + scale_x_continuous(breaks = seq(0, 20, 5)) + scale_y_continuous(breaks = seq(0, 20, 5)) + geom_abline(intercept = 3, slope = 0.5, color = "darkgray") + expand_limits(x = c(0,20), y = c(0,20)) + labs(title = "Data set 3")
p4 <- ggplot(anscombe) + geom_point(aes(x4, y4)) + theme_bw() + scale_x_continuous(breaks = seq(0, 20, 5)) + scale_y_continuous(breaks = seq(0, 20, 5)) + geom_abline(intercept = 3, slope = 0.5, color = "darkgray") + expand_limits(x = c(0,20), y = c(0,20)) + labs(title = "Data set 4")
grid.arrange(p1, p2, p3, p4)

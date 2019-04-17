# 100 random values taken from the normal distribution (mean = 0, standard deviation = 1)
set.seed(1)
data0 <- rnorm(100)
# shows us the values in the vector, plotted as points
plot(data0,t="p")
hist(data0)
qqnorm(data0, xlim = c(-3,3), ylim = c(-3,3), main = "Normal Q-Q Plot",
       xlab = "Theoretical Quantiles", ylab = "Sample Quantiles", plot.it = TRUE)
abline(a=0,b=1,lty=2)
shapiro.test(data0)
summary(data0)
sd(data0)
t.test(data0,mu=1)
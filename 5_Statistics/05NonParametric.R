# some simulated data for example
set.seed(1)
data3 <- rbeta(40,5,1)
data4 <- rbeta(40,2,1)
wilcox.test(data3,data4)
# For paired data, use the additional parameter.
wilcox.test(data3,data4,paired=TRUE)
# Kolmogorov-Smirnov test comparing data3 and data4
ks.test(data3,data4)
# generate the cumulative distribution functions
cdf3 <- ecdf(data3)
cdf4 <- ecdf(data4)
# open a pdf file
pdf("ksplot.pdf")
# plot out the result
plot(0, 0, type="l", xlim=c(0,1), ylim=c(0,1), xlab="Circularity", ylab="Cumulative probability")
lines(cdf3, lwd=2)
lines(cdf4, col="gray", lwd=2)
legend("topleft",legend=c("data3", "data4"), bty = "o", col=c("black", "gray"), lwd=2, bg = "white")
dev.off()
# requires EBImage
library(EBImage)
# EBImage can be installed using
install.packages("BiocManager")
BiocManager::install("EBImage")
# import each channel using EBImage
c1 <- readImage("c1.tif")
c2 <- readImage("c2.tif")
# assign the number of frames to a variable
fr = dim(c1)[3]
# make two empty vectors to receive SRCC results
r1 <- rep(NA, fr)
r2 <- rep(NA, fr)
# use a for loop to get SRCC for each frame
for (i in 1:fr ){
  r1[i] <- cor(as.vector(c1[,,i]), as.vector(c2[,,i]), method="spearman")
  r2[i] <- cor(sample(as.vector(c1[,,i])), as.vector(c2[,,i]), method="spearman")
}
# plot out the result using base R
png("corr.png")
par(cex = 1.5, mar = c(4, 4, 1, 1))
plot(0,0, type="l", xlim=c(0,fr), ylim=c(-0.1,1.2), xlab="Frame", ylab="SRCC")
lines(1:fr, r1, lwd=2)
lines(1:fr, r2, col="gray", lwd=2)
legend("topleft",legend=c("c1 vs c2", "randomized"), bty = "n", col=c("black", "gray"), lwd=2)
dev.off()


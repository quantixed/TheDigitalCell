data5 <- matrix(c(18, 460, 57, 466), byrow = TRUE, 2, 2)
rownames(data5) = c("Ctrl","RNAi")
colnames(data5) = c("Mitosis","Interphase")
data5
chisq.test(data5)
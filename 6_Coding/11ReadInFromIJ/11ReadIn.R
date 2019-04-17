# Start with a comment about the purpose of the script
# This code will analyze the multimeasure output from ImageJ
# import data
my_raw_data <- read.csv(file='Results.csv', header=TRUE, stringsAsFactors=FALSE)
# find the names of all columns
my_col_names <- colnames(my_raw_data)
# now find the columns named Mean* for each ROI
mean_columns <- my_col_names[grepl("^Mean",my_col_names)]
# make data frame with only mean columns
my_data <- subset(my_raw_data, select=mean_columns)
# have a look at each ROI
matplot(1:length(my_means), my_data,
        type = "l",
        lty = 1,
        col = "grey",
        xlab = "Frames",
        ylab = "Mean Pixel Density")
# calculate means per row
my_means <- rowMeans(my_data, na.rm=TRUE)
# open a pdf file
pdf("plot.pdf")
# plot out the result
plot(1:length(my_means), my_means, 
     type = "l", 
     col = "red", 
     lwd = 3,
     xlab = "Frames",
     ylab = "Mean Pixel Density")
# close the pdf file
dev.off()
# save the averaged data
write.csv(my_means, file = "output.csv",row.names=FALSE)
# Script to process multiple csv files containing output from multi-measure
#
# search all .csv files in current working directory
my_files <- list.files("./data/",pattern='*.csv', full.names = T)
# make directory for output if it doesn't exist
if (dir.exists("output")==FALSE) dir.create("output")
# function definition
calc_and_plot <- function(my_filename){
  # import data
  my_raw_data <- read.csv(file=my_filename, header=TRUE, stringsAsFactors=FALSE)
  # find the names of all columns
  my_col_names <- colnames(my_raw_data)
  # now find the columns named Mean* for each ROI
  mean_columns <- my_col_names[grepl("^Mean",my_col_names)]
  # make data frame with only mean columns
  my_data <- subset(my_raw_data, select=mean_columns)
  # calculate means per row
  my_means <- rowMeans(my_data, na.rm=TRUE)
  # retrieve the filename and extension from full path
  old_filename <- basename(my_filename)
  # output files will have "out_*" names
  my_output <- paste("out_",old_filename, sep = "")
  # convert *.csv name to *.pdf
  pdf_name <- paste(substr(my_output, 1, nchar(my_output)-4),".pdf",sep = "")
  # create path to output directory
  out_path <- file.path(getwd(),"output",pdf_name)
  # open a pdf file
  pdf(out_path)
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
  out_path <- file.path(getwd(),"output",my_output)
  write.csv(my_means, file = out_path,row.names=FALSE)
}
# call the function for each file in the list
for(i in 1:length(my_files)){
  my_filename <- my_files[i]
  calc_and_plot(my_filename)
}

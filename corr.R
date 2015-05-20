corr <- function(directory, threshold = 0) {
  complete_files = complete("specdata")
  complete_above_threshold = complete_files[complete_files$nobs > threshold, ]
  ids = complete_above_threshold$id

  results = numeric()
  for (i in ids) {
    formatted_filename = sprintf("%03d", i)
    filepath = paste(directory, "/", formatted_filename, ".csv", sep="")
    filedata = read.csv(filepath)
    results = append(results, cor(filedata$sulfate, filedata$nitrate, use = "complete.obs"))
  }

  results
}
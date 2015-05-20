complete <- function(directory, id = 1:332) {
  counts = c()
  for (i in id) {
    formatted_filename = sprintf("%03d", i)
    filepath = paste(directory, "/", formatted_filename, ".csv", sep="")  
    filedata = read.csv(filepath)
    complete = filedata[complete.cases(filedata), ]
    counts = append(counts, nrow(complete))
  }
  
  data.frame(id, nobs = counts)
}
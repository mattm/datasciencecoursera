pollutantmean <- function(directory, pollutant, id = 1:332) {
  total = 0
  items = 0
  for (i in id) {
    formatted_filename = sprintf("%03d", i)
    filepath = paste(directory, "/", formatted_filename, ".csv", sep="")  
    filedata = read.csv(filepath)
    pollutantdata = filedata[pollutant]
    presentdata = pollutantdata[!is.na(pollutantdata)]
    total = total + sum(presentdata)
    items = items + length(presentdata)
  }
  
  total / items
}
corr <- function(directory, threshold = 0) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0

        ## Return a numeric vector of correlations
        ## NOTE: Do not round the result!

    files <- (Sys.glob("specdata//*.csv"));
    
    correlations <- c()
    
    for (file in files) {
        fileData <- read.csv(file, sep = ",");
        completeCases <- fileData[complete.cases(fileData),];
        if (nrow(completeCases) > threshold) {
            correlations <- c(correlations, cor(completeCases$sulfate, completeCases$nitrate))
        }
    }
    
    return(correlations)
}
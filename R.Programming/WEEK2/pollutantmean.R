pollutantmean <- function(directory, pollutant, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'pollutant' is a character vector of length 1 indicating
        ## the name of the pollutant for which we will calculate the
        ## mean; either "sulfate" or "nitrate".

        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used

        ## Return the mean of the pollutant across all monitors list
        ## in the 'id' vector (ignoring NA values)
        ## NOTE: Do not round the result!

        ## Check and set directory
        if(grep("specdata",directory) == 1){
                directory <- ("./specdata/")
        }

        ## Initialize a vector variable to hold data
        meanVector <- c()

        ## Read all the files in specdata directory
        allFiles <- as.character( list.files(directory) )
        filePaths <- paste(directory, allFiles, sep="")

        for(index in id){
                currentFile <- read.csv(filePaths[index], header=TRUE, sep=",")
                head(currentFile)
                removedNa <- currentFile[ !is.na(currentFile[, pollutant]), pollutant ]
                meanVector <- c(meanVector,removedNa)
        }

        return (mean(meanVector))

}

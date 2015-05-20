complete <- function(directory, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return a data frame of the form:
        ## id nobs
        ## 1  117
        ## 2  1041
        ## ...
        ## where 'id' is the monitor ID number and 'nobs' is the
        ## number of complete cases

        if( grep("specdata", directory) == 1){
                directory <- ("./specdata/")
        }
        nobs <- c();

        # Read all files in specdata directory
        allFiles <- as.character( list.files(directory) )
        filePaths <- paste(directory, allFiles, sep="")

        for(index in id){
                fileData <- read.csv(filePaths[index], header=TRUE, sep=",")
                completeCases <- fileData[complete.cases(fileData), ]
                nobs <- c(nobs, nrow(completeCases))
        }

        return (data.frame(cbind(id,nobs)))


}
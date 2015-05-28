best <- function(state,outcome){

	## Read outcome data
	## Check that state and outcome are valid
	## Return hospital name in that state with lowest 30-day death
	## rate

	fileData <- read.csv("outcome-of-care-measures.csv", sep=",")

	validStates <- c("AL", "AK", "AZ", "AR", "CA", "CO", "CT", "DE", "FL", "GA", "HI", "ID", "IL", "IN", "IA", "KS", "KY", "LA", "ME", "MD", "MA", "MI", "MN", "MS", "MO", "MT", "NE", "NV", "NH", "NJ", "NM", "NY", "NC", "ND", "OH", "OK", "OR", "PA", "RI", "SC", "SD", "TN", "TX", "UT", "VT", "VA", "WA", "WV", "WI", "WY")
	validOutcomes <-c("heart attack", "heart failure", "pneumonia")
	if (!is.element(state, validStates)) stop("invalid state")
    if (!is.element(outcome, validOutcomes)) stop("invalid outcome")

    data <- fileData[fileData$State == state,]
    headerName <- NULL
    if (outcome == "heart attack"){
    	headerName <- "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"
    } else if (outcome == "heart failure"){
    	headerName <- "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"
    } else if (outcome == "pneumonia"){
    	headerName <- "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"
    }

    return (bestservice(data,headerName))

}

bestservice <- function(data,headerName){
	mortalityRate <- data[,headerName]
    mortalityRate <- mortalityRate[!mortalityRate == "Not Available"]
    mortalityRate <- as.numeric(as.character(mortalityRate))
    minimumRate <- min(mortalityRate)
    bestHospital <- data[data[,headerName] == minimumRate,]
    hospitalName <- sort(bestHospital[,"Hospital.Name"])
    return (as.character(hospitalName[1]))
}
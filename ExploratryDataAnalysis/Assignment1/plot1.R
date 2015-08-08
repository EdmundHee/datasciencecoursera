# Read and convertthe data set
dataSet <- read.csv("./data/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
dataSet$Date <- as.Date(dataSet$Date, format="%d/%m/%Y")

data <- subset(dataSet, subset=(Date <= "2007-02-02" & Date >= "2007-02-01") )
rm(DataSet)

dateTime <- paste(as.Date(data$Date),data$Time)
data$Datetime <- as.POSIXct(dateTime)

hist(data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
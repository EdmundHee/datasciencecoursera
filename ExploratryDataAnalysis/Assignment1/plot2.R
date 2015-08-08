# Read and convert the data set
dataSet <- read.csv("./data/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
dataSet$Date <- as.Date(dataSet$Date, format="%d/%m/%Y")

data <- subset(dataSet, subset=(Date <= "2007-02-02" & Date >= "2007-02-01") )
rm(dataSet)

dateTime <- paste(as.Date(data$Date),data$Time)
data$Datetime <- as.POSIXct(dateTime)

plot(data$Global_active_power~data$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
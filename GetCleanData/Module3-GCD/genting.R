
URL <- "http://real-chart.finance.yahoo.com/table.csv?s=GMALF&d=6&e=8&f=2015&g=d&a=5&b=18&c=2013&ignore=.csv"

download.file(URL, destfile = "./genting.csv", method="curl")

data<-read.csv(file="./genting.csv",head=TRUE, sep=",")

print("Number of observations")
print(nrow(data))
print("Number of Variables")
print(ncol(data))
print("Dimension of Data")
print(dim(data))
print("Calculate the average closing price")
print(mean(data$Close))
print("Number of days where the closing price is more than RM1.35")
print(length(which(data$Close > 1.35)))

URL <- "https://d396qusza40orc.cloudfront.net/getdata/data/DATA.gov_NGAP.xlsx"

download.file(URL, destfile="./ngap.xlsx", method="curl")

data <- read.csv(file="./ngap.xlxs",head=TRUE,sep=",")
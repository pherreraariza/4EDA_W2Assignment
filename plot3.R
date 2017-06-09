setwd("/Users/pherreraariza/Documents/Coursera/4_Exploratory_Data_Analysis/4EDA_W1Assignment")

## Get the data
file <- "./household_power_consumption.txt"
data <- read.table(file, header = TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
dataSubset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

## Change format to dates and sub metering variables
dataSubset$Sub_metering_1 <- as.numeric(dataSubset$Sub_metering_1)
dataSubset$Sub_metering_2 <- as.numeric(dataSubset$Sub_metering_2)
dataSubset$Sub_metering_3 <- as.numeric(dataSubset$Sub_metering_3)
dataSubset$datetime <- strptime(paste(dataSubset$Date, dataSubset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

## Plot 3
plot(dataSubset$datetime, dataSubset$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(dataSubset$datetime, dataSubset$Sub_metering_2, col="red")
lines(dataSubset$datetime, dataSubset$Sub_metering_3, col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1))
       
## Saving to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()

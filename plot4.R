setwd("/Users/pherreraariza/Documents/Coursera/4_Exploratory_Data_Analysis/4EDA_W1Assignment")

## Get the data
file <- "./household_power_consumption.txt"
data <- read.table(file, header = TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
dataSubset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

## Change format to dates and all variables needed
dataSubset$Global_active_power <- as.numeric(dataSubset$Global_active_power)
dataSubset$Global_reactive_power <- as.numeric(dataSubset$Global_reactive_power)
dataSubset$Voltage <- as.numeric(dataSubset$Voltage)
dataSubset$Sub_metering_1 <- as.numeric(dataSubset$Sub_metering_1)
dataSubset$Sub_metering_2 <- as.numeric(dataSubset$Sub_metering_2)
dataSubset$Sub_metering_3 <- as.numeric(dataSubset$Sub_metering_3)
dataSubset$datetime <- strptime(paste(dataSubset$Date, dataSubset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

## Plot 4
par(mfrow=c(2,2))
    
    plot(dataSubset$datetime,dataSubset$Global_active_power, type="l", xlab="", ylab="Global Active Power")
    plot(dataSubset$datetime, dataSubset$Voltage, type="l", xlab="datetime", ylab="Voltage")
    plot(dataSubset$datetime, dataSubset$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
    lines(dataSubset$datetime, dataSubset$Sub_metering_2, col="red")
    lines(dataSubset$datetime, dataSubset$Sub_metering_3, col="blue")
    legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), bty="n", cex=.5)
    plot(dataSubset$datetime, dataSubset$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

## Saving to file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()

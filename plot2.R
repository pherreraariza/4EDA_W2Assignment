setwd("/Users/pherreraariza/Documents/Coursera/4_Exploratory_Data_Analysis/4EDA_W1Assignment")

## Get the data
file <- "./household_power_consumption.txt"
data <- read.table(file, header = TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
dataSubset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

## Change format to date and global active power variable
dataSubset$Global_active_power <- as.numeric(dataSubset$Global_active_power)
dataSubset$datetime <- strptime(paste(dataSubset$Date, dataSubset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

## Plot 2
plot(dataSubset$datetime, dataSubset$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

## Saving to file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()

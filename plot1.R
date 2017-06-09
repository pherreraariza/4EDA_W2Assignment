setwd("/Users/pherreraariza/Documents/Coursera/4_Exploratory_Data_Analysis/4EDA_W1Assignment")

## Get the data
file <- "./household_power_consumption.txt"
data <- read.table(file, header = TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
dataSubset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

## Change format to global active power variable
dataSubset$Global_active_power <- as.numeric(dataSubset$Global_active_power)

## Plot 1
hist(dataSubset$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()


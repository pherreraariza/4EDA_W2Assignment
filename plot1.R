setwd("/Users/pherreraariza/Documents/Coursera/4_Exploratory_Data_Analysis")

# Check if files exists

if(!exists("NEI")){
  NEI <- readRDS("./exdata-data-NEI_data/summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("./exdata-data-NEI_data/Source_Classification_Code.rds")
}

# Calculate the emission by year

aggregatedTotalByYear <- aggregate(Emissions ~ year, NEI, sum)

# Print and export the graph

png('plot1.png')
barplot(height=aggregatedTotalByYear$Emissions/1000, names.arg=aggregatedTotalByYear$year, xlab="years", ylab=expression('total PM'[2.5]*' emission in ktons'),main=expression('Total PM'[2.5]*' emissions at various years'))
dev.off()
setwd("/Users/pherreraariza/Documents/Coursera/4_Exploratory_Data_Analysis")

# Check if files exists

if(!exists("NEI")){
  NEI <- readRDS("./exdata-data-NEI_data/summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("./exdata-data-NEI_data/Source_Classification_Code.rds")
}

# Subset Baltimore emissions

subsetNEI  <- NEI[NEI$fips=="24510", ]
aggregatedTotalByYear <- aggregate(Emissions ~ year, subsetNEI, sum)

# Print and export the graph

png('plot2.png')
barplot(height=aggregatedTotalByYear$Emissions/1000, names.arg=aggregatedTotalByYear$year, xlab="years", ylab=expression('total PM'[2.5]*' emission in ktons'),main=expression('Total PM'[2.5]*' in the Baltimore City, MD emissions at various years'))
dev.off()
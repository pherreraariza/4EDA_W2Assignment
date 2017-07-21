library(ggplot2)

setwd("/Users/pherreraariza/Documents/Coursera/4_Exploratory_Data_Analysis")

# Check if files exists

if(!exists("NEI")){
  NEI <- readRDS("./exdata-data-NEI_data/summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("./exdata-data-NEI_data/Source_Classification_Code.rds")
}

# Merge the two data sets 

if(!exists("NEISCC")){
  NEISCC <- merge(NEI, SCC, by="SCC")
}

# Subset coal emissions

coalMatches  <- grepl("coal", NEISCC$Short.Name, ignore.case=TRUE)
subsetNEISCC <- NEISCC[coalMatches, ]
aggregatedTotalByYear <- aggregate(Emissions ~ year, subsetNEISCC, sum)

# Print and export the graph

png("plot4.png", width=640, height=480)
g <- ggplot(aggregatedTotalByYear/1000, aes(factor(year), Emissions, fill = year))
g <- g + geom_bar(stat="identity") +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions im ktons")) +
  ggtitle('Total Emissions from coal sources from 1999 to 2008')
print(g)
dev.off()
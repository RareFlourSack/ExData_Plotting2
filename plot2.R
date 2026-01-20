NEI <- readRDS("./extracted_data/summarySCC_PM25.rds")
SCC <- readRDS("./extracted_data/Source_Classification_Code.rds")

NEI_baltimore <- NEI[NEI$fips == "24510",]

baltimore_totals <- aggregate(Emissions ~ year, NEI_baltimore, sum)

barplot(baltimore_totals$Emissions, names.arg = aggregate_totals$year, xlab = "Year", ylab = "Total PM2.5 Emissions (Tons)", main = "Total PM2.5 Emissions in Baltimore, Maryland")

dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()
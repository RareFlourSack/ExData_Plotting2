library(ggplot2)

NEI <- readRDS("./extracted_data/summarySCC_PM25.rds")
SCC <- readRDS("./extracted_data/Source_Classification_Code.rds")

NEI_baltimore <- NEI[NEI$fips == "24510",]

ggplot(NEI_baltimore, aes(factor(year), Emissions, fill = type)) + geom_bar(stat = "identity") + facet_grid(. ~ type, scales = "free", space = "free") + labs(x = "Year", y = "Total PM2.5 Emissions (Tons)", title = "Total PM2.5 Emissions in Baltimore, Maryland by Source") + guides(fill = FALSE)

dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()
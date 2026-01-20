NEI <- readRDS("./extracted_data/summarySCC_PM25.rds")
SCC <- readRDS("./extracted_data/Source_Classification_Code.rds")

vehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case = "TRUE")

vehicles_SCC <- SCC[vehicles,]$SCC
vehicles_NEI <- NEI[NEI$SCC %in% vehicles_SCC,]

baltimore_vehicles <- vehicles_NEI[vehicles_NEI == "24510",]

ggplot(baltimore_vehicles, aes(factor(year), Emissions)) + geom_bar(stat = "identity", fill = "grey") + labs(x = "Year", y = "Total PM2.5 Emissions", title = "PM2.5 Emissions in Baltimore, Maryland from Motor Vehicle Sources") + guides(fill = FALSE)

dev.copy(png, file = "plot5.png", height = 480, width = 480)
dev.off()
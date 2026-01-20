NEI <- readRDS("./extracted_data/summarySCC_PM25.rds")
SCC <- readRDS("./extracted_data/Source_Classification_Code.rds")

vehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case = "TRUE")

vehicles_SCC <- SCC[vehicles,]$SCC
vehicles_NEI <- NEI[NEI$SCC %in% vehicles_SCC,]

baltimore_vehicles <- vehicles_NEI[vehicles_NEI == "24510",]
baltimore_vehicles$city <- "Baltimore"

la_vehicles <- vehicles_NEI[vehicles_NEI == "06037",]
la_vehicles$city <- "Los Angeles"

balt_la <- rbind(baltimore_vehicles, la_vehicles)

ggplot(balt_la, aes(factor(year), Emissions, fill = city)) + geom_bar(stat = "identity", aes(fill = year)) + facet_grid(scales = "free", space = "free", . ~ city) + labs(x = "Year", y = "Total PM2.5 Emissions", title = "PM2.5 Emissions in Baltimore and Los Angeles") + guides(fill = FALSE)

dev.copy(png, file = "plot6.png", height = 480, width = 480)
dev.off()
NEI <- readRDS("./extracted_data/summarySCC_PM25.rds")
SCC <- readRDS("./extracted_data/Source_Classification_Code.rds")

combustion <- grepl("combust", SCC$SCC.Level.One, ignore.case = "TRUE")
coal <- grepl("coal", SCC$SCC.Level.Four, ignore.case = "TRUE")
combined <- combustion & coal

combustion_SCC <- SCC[combined,]$SCC
combustion_NEI <- NEI[NEI$SCC %in% combustion_SCC,]

ggplot(combustion_NEI, aes(factor(year), Emissions/(10^5))) + geom_bar(stat = "identity", fill = "grey") + labs(x = "Year", y = "Total PM2.5 Emissions (10^5 Tons)", title = "Coal Combustion PM2.5 Emissions in the US") + guides(fill = FALSE)

dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()
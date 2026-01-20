url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
dest_file <- "./pm25.zip"

download.file(url, destfile = dest_file, mode = "wb")

unzip("pm25.zip", exdir = "extracted_data")

NEI <- readRDS("./extracted_data/summarySCC_PM25.rds")
SCC <- readRDS("./extracted_data/Source_Classification_Code.rds")

aggregate_totals <- aggregate(Emissions ~ year, NEI, sum)

barplot((aggregate_totals$Emissions)/(10^6), names.arg = aggregate_totals$year, xlab = "Year", ylab = "Total PM2.5 Emissions (10^6 Tons)", main = "Total PM2.5 Emissions From All Sources")

dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()
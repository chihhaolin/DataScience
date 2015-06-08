## load data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## subset data: Baltimore City & calculate result
BaltimoreCity = subset(NEI, fips == "24510")
PM2.5_BaltimoreCity = tapply(BaltimoreCity$Emissions, BaltimoreCity$year, sum)

## plot
png(filename = "plot2.png")
par(mfrow=c(1,1))
barplot(PM2.5_BaltimoreCity,main = expression('Total PM'[2.5] * ' Emission in Baltimore City, Maryland' ), xlab = 'Year', ylab = expression(paste('PM', ''[2.5], ' in tons')))
dev.off()


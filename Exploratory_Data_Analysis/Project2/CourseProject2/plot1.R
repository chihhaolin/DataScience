## load data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## calculate result
PM2.5byYear = tapply(NEI$Emissions, NEI$year, sum)
PM2.5byYear = PM2.5byYear/1000


## plot
png(filename = "plot1.png")
par(mfrow=c(1,1))
barplot(PM2.5byYear,main = expression('Total Emission of PM'[2.5]), xlab = 'Year', ylab = expression(paste('PM', ''[2.5], ' in Kilotons')))
dev.off()
## load data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


## subset data
SCC.coal = SCC[grepl("coal", SCC$Short.Name, ignore.case = TRUE), ]
Coal.Data <- merge(x = NEI, y = SCC.coal, by = 'SCC')


## calculate
PM2.5byYear = tapply(Coal.Data$Emissions, Coal.Data$year, sum)
PM2.5byYear = PM2.5byYear/1000
DF = data.frame(year=names(PM2.5byYear),PM2.5=PM2.5byYear)
DF$year = strtoi(DF$year)

## plot
library(ggplot2)
png('plot4.png')
ggplot(data = DF, aes(x = year, y = PM2.5) ) + 
  geom_line() +
  geom_point( size =4) + 
  ylab(expression(paste('PM', ''[2.5], ' in Kilotons'))) + 
  xlab('Year') + 
  ggtitle(expression('Total Coal Combustion-Related Emission of PM'[2.5])) + 
  geom_text(aes(label = round(PM2.5, 0),hjust = 0.5, vjust = -0.5), color="black")
dev.off()


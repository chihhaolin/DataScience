## load data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

table(NEI$type)

## subset data: Baltimore City
BaltimoreCity = subset(NEI, fips == "24510" &  type == "ON-ROAD")
BaltimoreCity$type = as.factor(BaltimoreCity$type)

str(BaltimoreCity)

PM2.5 = tapply(BaltimoreCity$Emissions, BaltimoreCity$year, sum)
DF = data.frame(year=names(PM2.5), PM2.5=PM2.5)
DF$year = strtoi(DF$year)

## plot
library(ggplot2)
png('plot5.png')
ggplot(data = DF, aes(x = year, y = PM2.5) ) +
  geom_point( size =4) + 
  geom_line() +
  ylab(expression('PM'[2.5]*' in tons')) + 
  xlab('Year') + 
  ggtitle('Total Emissions of Motor Vehicle Sources in Baltimore City, Maryland') + 
  geom_text(aes(label = round(PM2.5, 0),hjust = 0.5, vjust = -0.5), color="black")
dev.off()



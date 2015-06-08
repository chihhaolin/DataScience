## load data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## subset data: Baltimore City
BaltimoreCity = subset(NEI, fips == "24510")
BaltimoreCity$type = as.factor(BaltimoreCity$type)


## calculate results and save results into "DF"
library(dplyr)
BaltimoreCity %>%
  group_by(type, year) %>%
  summarise(PM2.5 = sum(Emissions)) -> DF
  

## plot
library(ggplot2)
png('plot3.png',width = 700, height = 500, units = 'px')
ggplot(data = DF, aes(x = year, y = PM2.5, color=type, shape=type) ) +
  geom_point( size =4) + 
  geom_line() +
  ylab(expression( 'PM'[2.5]* ' in tons')) + 
  xlab('Year') + 
  ggtitle('Emissions per Type in Baltimore City, Maryland')   
dev.off()



## load data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI$type = as.factor(NEI$type)

## subset data
BaltimoreCity = subset(NEI, fips == "24510" &  type == "ON-ROAD")
LosAngelesCounty = subset(NEI, fips == "06037" &  type == "ON-ROAD")


## calculate PM2.5 by year
PM2.5 = tapply(BaltimoreCity$Emissions, BaltimoreCity$year, sum)
DF = data.frame(year=names(PM2.5), PM2.5=PM2.5, City=rep("Baltimore City",4))
DF$year = strtoi(DF$year)

PM2.5 = tapply(LosAngelesCounty$Emissions, LosAngelesCounty$year, sum)
DF2 = data.frame(year=names(PM2.5), PM2.5=PM2.5, City=rep("LosAngeles County",4))
DF2$year = strtoi(DF2$year)

## combine two dataframe BaltimoreCity & LosAngelesCounty
DF = rbind(DF,DF2)
rownames(DF) = 1:nrow(DF)

## plot
png('plot6.png', width = 700, height = 500, units = 'px')
ggplot(data = DF, aes(x = year, y = PM2.5, color=City, shape=City) ) +
  geom_point( size =4) + 
  geom_line() +
  ylab(expression('PM'[2.5]*' in tons')) + 
  xlab('Year') + 
  ggtitle('Total Emissions of Motor Vehicle Sources') +
  geom_text(aes(label = round(PM2.5, 0),hjust = 0.5, vjust = -0.5), color="black")
dev.off()


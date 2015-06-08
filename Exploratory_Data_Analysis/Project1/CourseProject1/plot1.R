## Getting dataset
data_all <- read.csv("household_power_consumption.txt", sep=';',na.strings="?",nrows=2075259, stringsAsFactors=FALSE)
str(data_all)

## changing the data_all$Date into Dates format
data_all$Date <- as.Date(data_all$Date, format="%d/%m/%Y")

## Subsetting the dataset 
data <- subset(data_all, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_all)


## Plot 1
png(filename = "plot1.png", width=480, height=480)
par(mfrow=c(1,1))
hist(data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.off()

## Saving to file
#dev.copy(png, file="plot1.png", height=480, width=480)
#dev.off()
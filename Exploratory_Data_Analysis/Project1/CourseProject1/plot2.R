## Getting dataset
data_all <- read.csv("household_power_consumption.txt", sep=';',na.strings="?",nrows=2075259, stringsAsFactors=FALSE)
str(data_all)

## changing the data_all$Date into Dates format
data_all$Date <- as.Date(data_all$Date, format="%d/%m/%Y")

## Subsetting the dataset 
data <- subset(data_all, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_all)

## Converting dates
datetime <- paste(data$Date, data$Time)
data$Datetime <- as.POSIXct(datetime)

## changing the locale due to the format issues
Sys.setlocale("LC_ALL", "C")

## Plot 2
png(filename = "plot2.png", width=480, height=480)
par(mfrow=c(1,1))
plot(data$Global_active_power~data$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.off()

## Saving to file
#dev.copy(png, file="plot2.png", height=480, width=480)
#dev.off()
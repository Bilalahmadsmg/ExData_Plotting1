

## Reading complete dataset and assingning it to variable
powerConsumptionData <- read.csv("C:\\Users\\Bilal\\Desktop\\First-Project\\Fourth month\\first week\\Peer Graded Assignment\\household_power_consumption.txt", header = T, sep = ';', 
                      na.strings = "?", nrows = 2075259, check.names = F, 
                      stringsAsFactors = F, comment.char = "", quote = '\"')
powerConsumptionData$Date <- as.Date(powerConsumptionData$Date, format = "%d/%m/%Y")

## Subsetting only 1/2/2007 and 2/2/2007 data
submeteringData <- subset(powerConsumptionData, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
## Converting dates
date_time <- paste(as.Date(submeteringData$Date), submeteringData$Time)
submeteringData$Datetime <- as.POSIXct(date_time)


## Generating Submetering Plot

with(submeteringData, {
  plot(Sub_metering_1 ~ Datetime, type = "l", 
       ylab = "Global Active Power (kilowatts)", xlab = "")
  lines(Sub_metering_2 ~ Datetime, col = 'Red')
  lines(Sub_metering_3 ~ Datetime, col = 'Blue')
})
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

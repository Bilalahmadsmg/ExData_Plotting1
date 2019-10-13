## Reading complete household power consumption Data and assingning it to variable
powerConsumptionData <- read.csv("C:\\Users\\Bilal\\Desktop\\First-Project\\Fourth month\\first week\\Peer Graded Assignment\\household_power_consumption.txt", header = T, sep = ';', 
                      na.strings = "?", nrows = 2075259, check.names = F, 
                      stringsAsFactors = F, comment.char = "", quote = '\"')
powerConsumptionData$Date <- as.Date(powerConsumptionData$Date, format = "%d/%m/%Y")

## Subsetting only 1/2/2007 and 2/2/2007 data
twoDaysData <- subset(powerConsumptionData, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

## Converting dates
datetime <- paste(as.Date(twoDaysData$Date), twoDaysData$Time)
twoDaysData$Datetime <- as.POSIXct(datetime)


## Generating multiple Plots
par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))
with(twoDaysData, {
  plot(Global_active_power ~ Datetime, type = "l", 
       ylab = "Global Active Power", xlab = "")
  plot(Voltage ~ Datetime, type = "l", ylab = "Voltage", xlab = "datetime")
  plot(Sub_metering_1 ~ Datetime, type = "l", ylab = "Energy sub metering",
       xlab = "")
  lines(Sub_metering_2 ~ Datetime, col = 'Red')
  lines(Sub_metering_3 ~ Datetime, col = 'Blue')
  legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
         bty = "n",
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power ~ Datetime, type = "l", 
       ylab = "Global_reactive_power", xlab = "datetime")
})

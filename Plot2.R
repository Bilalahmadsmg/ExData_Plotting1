## Reading complete dataset and assingning it to variable
powerConsumptionData <- read.csv("C:\\Users\\Bilal\\Desktop\\First-Project\\Fourth month\\first week\\Peer Graded Assignment\\household_power_consumption.txt", header = T, sep = ';', 
                      na.strings = "?", nrows = 2075259, check.names = F, 
                      stringsAsFactors = F, comment.char = "", quote = '\"')
powerConsumptionData$Date <- as.Date(powerConsumptionData$Date, format = "%d/%m/%Y")

## Subsetting only 1/2/2007 and 2/2/2007 data
data <- subset(powerConsumptionData, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(powerConsumptionData)

## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Generating Time series Plot 
plot(data$Global_active_power ~ data$Datetime, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")






# Reading the data

df <- file("C:\\Users\\Bilal\\Desktop\\First-Project\\Fourth month\\first week\\Peer Graded Assignment\\household_power_consumption.txt")

# Subsetting only 1/2/2007 and 2/2/2007 data
twoDaysData <- read.table(text = grep("^[1,2]/2/2007", readLines(df), value = TRUE), col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";", header = TRUE)



# Generating Histogram Plot 
hist(twoDaysData$Global_active_power, col = "red", main = paste("Global Active Power"), xlab = "Global Active Power (in kilowatts)")

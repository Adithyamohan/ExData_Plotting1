#Import Power Consumption
raw_data <- read.table('/Users/mohana/Documents/Coursera/WDir/Exploratory Data Analysis/household_power_consumption.txt', sep=';', header=T, 
                       colClasses = c('character', 'character', 'numeric',
                                      'numeric', 'numeric', 'numeric',
                                      'numeric', 'numeric', 'numeric'),
                       na.strings='?')
# Merge with Time 
raw_data$DateTime <- strptime(paste(raw_data$Date, raw_data$Time), 
                              "%d/%m/%Y %H:%M:%S")

# Filter Date
data <- subset(raw_data, 
               as.Date(DateTime) >= as.Date("2007-02-01") & 
                   as.Date(DateTime) <= as.Date("2007-02-02"))

# Open plot3.png
png("plot3.png", height=480, width=480)

# Build time series
plot(data$DateTime, 
     data$Sub_metering_1, 
     pch=NA, 
     xlab="", 
     ylab="Energy sub metering")
lines(data$DateTime, data$Sub_metering_1)
lines(data$DateTime, data$Sub_metering_2, col='red')
lines(data$DateTime, data$Sub_metering_3, col='blue')
legend('topright', 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = c(1,1,1),
       col = c('black', 'red', 'blue'))

# Close PNG file
dev.off()
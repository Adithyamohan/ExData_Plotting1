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
# Open plot2.png
png("plot2.png", height=480, width=480)

# Build time series
plot(data$DateTime, 
     data$Global_active_power, 
     pch=NA, 
     xlab="", 
     ylab="Global Active Power (kilowatts)")
lines(data$DateTime, data$Global_active_power)

# Close PNG file
dev.off()
raw_data <- read.table('/Users/mohana/Documents/Coursera/WDir/Exploratory Data Analysis/household_power_consumption.txt', sep=';', header=T, 
                   colClasses = c('character', 'character', 'numeric',
                                  'numeric', 'numeric', 'numeric',
                                  'numeric', 'numeric', 'numeric'),
                   na.strings='?')
# Filter Date
data <- subset(raw_data,as.Date(strptime(raw_data$Date, format='%d/%m/%Y')) >= as.Date("2007-02-01") & 
                   as.Date(strptime(raw_data$Date, format='%d/%m/%Y'))<= as.Date("2007-02-02"))    

# Open plot1.png
png("plot1.png", height=480, width=480)

# Build histogram
hist(data$Global_active_power, col='red', 
     xlab = 'Global Active Power (kilowatts)',
     main = 'Global Active Power')

# Close PNG file
dev.off()
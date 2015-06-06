require(sqldf)

# Read in data only during desired dates 2007-02-01 and 2007-02-02
power <- read.csv.sql("household_power_consumption.txt", sql = "select * from file where Date in ('1/2/2007','2/2/2007')", header = TRUE, sep = ";")

# Combine date and time fields and convert to chronological "datetime"
time <- paste(power$Date, power$Time)
time <- strptime(time, format = "%d/%m/%Y %H:%M:%S")

# Clear any existing plot
frame()

# Create PNG file of plot
png("plot2.png", width = 480, height = 480, units = "px")
plot(time, power$Global_active_power,
     xlab = "", ylab = "Global Active Power (kilowatts)",
     col = "black", type = "l")
dev.off()


require(sqldf)
power <- read.csv.sql("household_power_consumption.txt", sql = "select * from file where Date in ('1/2/2007','2/2/2007')", header = TRUE, sep = ";")

time <- paste(power$Date, power$Time)
power$datetime <- strptime(time, format = "%d/%m/%Y %H:%M:%S")

frame()

png("plot4.png", width = 480, height = 480, units = "px")
par(mfrow = c(2,2))
with(power, {
  plot(datetime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
  plot(datetime, Voltage, type = "l")
  plot(datetime, Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
  lines(datetime, Sub_metering_2, col = "red")
  lines(datetime, Sub_metering_3, col = "blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1, 1, 1), col = c("black", "red", "blue"))
  plot(datetime, Global_reactive_power, type = "l")
})
dev.off()

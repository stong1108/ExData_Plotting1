require(sqldf)
power <- read.csv.sql("household_power_consumption.txt", sql = "select * from file where Date in ('1/2/2007','2/2/2007')", header = TRUE, sep = ";")

time <- paste(power$Date, power$Time)
power$Time <- strptime(time, format = "%d/%m/%Y %H:%M:%S")

frame()
png("plot3.png", width = 480, height = 480, units = "px")
with(power, {plot(Time, Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
  lines(Time, Sub_metering_2, col = "red")
  lines(Time, Sub_metering_3, col = "blue")
})

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1, 1, 1), col = c("black", "red", "blue"))
dev.off()
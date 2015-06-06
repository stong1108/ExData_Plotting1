require(sqldf)
power <- read.csv.sql("household_power_consumption.txt", sql = "select * from file where Date in ('1/2/2007','2/2/2007')", header = TRUE, sep = ";")

time <- paste(power$Date, power$Time)
time <- strptime(time, format = "%d/%m/%Y %H:%M:%S")

frame()
png("plot2.png", width = 480, height = 480, units = "px")
plot(time, power$Global_active_power,
     xlab = "", ylab = "Global Active Power (kilowatts)",
     col = "black", type = "l")
dev.off()


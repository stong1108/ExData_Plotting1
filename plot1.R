require(sqldf)

# Read in data only during desired dates 2007-02-01 and 2007-02-02
power <- read.csv.sql("household_power_consumption.txt", sql = "select * from file where Date in ('1/2/2007','2/2/2007')", header = TRUE, sep = ";")

# Clear any existing plot
frame()

# Create PNG file of plot
png("plot1.png", width = 480, height = 480, units = "px")
hist(power$Global_active_power,
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     ylim = c(0,1200),
     col = "red")
dev.off()
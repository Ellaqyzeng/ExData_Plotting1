library(dplyr)

# Read the data and make subsets for specified groups of data
a <- read.table('household_power_consumption.txt',header = TRUE, sep = ";", na.strings = "?")
powerdata <- tbl_df(a) #need to put _df because it is a data frame
colnames(powerdata)

newpowerdata <- subset(a, a$Date=="1/2/2007"|a$Date=="2/2/2007")
nrow(newpowerdata)

b <- newpowerdata$Global_active_power

# plot 4
png("plot4.png", width = 480, height = 480)
dev.cur()

par(mfrow = c(2, 2))

# plot 4_1
plot(datetime, newpowerdata$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

# plot 4_2
plot(datetime, newpowerdata$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

# plot 4_3
plot(datetime, newpowerdata$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(datetime, newpowerdata$Sub_metering_2, col = "red")
lines(datetime, newpowerdata$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, bty = "n")

# plot 4_4
plot(datetime, newpowerdata$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()

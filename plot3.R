library(dplyr)

# Read the data and make subsets for specified groups of data
a <- read.table('household_power_consumption.txt',header = TRUE, sep = ";", na.strings = "?")
powerdata <- tbl_df(a) #need to put _df because it is a data frame
colnames(powerdata)

newpowerdata <- subset(a, a$Date=="1/2/2007"|a$Date=="2/2/2007")
nrow(newpowerdata)

b <- newpowerdata$Global_active_power

# plot 3
png("plot3.png", width = 480, height = 480)
dev.cur()

plot(datetime, newpowerdata$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(datetime, newpowerdata$Sub_metering_2, col = "red")
lines(datetime, newpowerdata$Sub_metering_3, col = "blue")

legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)
# "lty, lwd": the line types and widths for lines appearing in the legend. One of these two must be specified for line drawing.

dev.off()

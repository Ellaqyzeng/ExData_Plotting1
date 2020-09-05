library(dplyr)

# Read the data and make subsets for specified groups of data
a <- read.table('household_power_consumption.txt',header = TRUE, sep = ";", na.strings = "?")
powerdata <- tbl_df(a) #need to put _df because it is a data frame
colnames(powerdata)

newpowerdata <- subset(a, a$Date=="1/2/2007"|a$Date=="2/2/2007")
nrow(newpowerdata)

# plot1
b <- newpowerdata$Global_active_power
class(b)
png("plot1.png", width = 480, height = 480)
dev.cur()

hist(b, main = "Global Active Power", xlab = "Global Active Power (kilowatt)", ylab = "Frequency",col = "red")
dev.off()

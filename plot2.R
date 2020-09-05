library(dplyr)

# Read the data and make subsets for specified groups of data
a <- read.table('household_power_consumption.txt',header = TRUE, sep = ";", na.strings = "?")
powerdata <- tbl_df(a) #need to put _df because it is a data frame
colnames(powerdata)

newpowerdata <- subset(a, a$Date=="1/2/2007"|a$Date=="2/2/2007")
nrow(newpowerdata)

b <- newpowerdata$Global_active_power

# plot2
png("plot2.png", width = 480, height = 480)
dev.cur()

# make a POSIXct date and time 
# strptime expects a character vector, otherwise it calls the as.character(x) on whatever you pass in.
datetime <-strptime(paste(newpowerdata$Date, newpowerdata$Time), format = "%d/%m/%Y %H:%M:%S") 
# paste to Concatenate (link together) vectors after converting to character

plot(datetime, b, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()

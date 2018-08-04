#Setup Working Directory
setwd("./datascience3homework")

#Read File
files <- file('./household_power_consumption.txt')
data1 <- read.table(text = grep("^[1,2]/2/2007",readLines(files),value=TRUE), sep = ';', col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), na.strings = '?')

# convert data and time to specific format
data1$Date <- as.Date(data1$Date, format = '%d/%m/%Y')
data1$DateTime <- as.POSIXct(paste(data1$Date, data1$Time))

#PLOT 1
#Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels
png(filename = './plot1.png', width = 480, height = 480, units = "px")
#Plotting
hist(data1$Global_active_power,xlab = 'Global Active Power (kilowatt)', main = 'Global Active Power', col = 'red')
dev.off()


#PLOT 2
#Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels
png(filename = './plot2.png', width = 480, height = 480, units = "px")
#Plotting
plot(data1$Global_active_power~data1$DateTime,xlab="",ylab = "Global Active Power (kilowatt)",type="l")
dev.off()

#PLOT 3
#Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels
png(filename = './plot3.png', width = 480, height = 480, units = "px")
#Plotting
plot(data1$Sub_metering_1~data1$DateTime,xlab="",ylab = "Energy sub metering",type="l")
lines(data1$Sub_metering_2~data1$DateTime,type="l",col="red")
lines(data1$Sub_metering_3~data1$DateTime,type="l",col="blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c('black', 'red', 'blue'),lwd=1)
dev.off()


#PLOT 4
#Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels
png(filename = './plot4.png', width = 480, height = 480, units = "px")
#Plotting
par(mfcol=c(2,2))
plot(data1$Global_active_power~data1$DateTime,xlab="",ylab = "Global Active Power",type="l")
plot(data1$Sub_metering_1~data1$DateTime,xlab="",ylab = "Energy sub metering",type="l")
lines(data1$Sub_metering_2~data1$DateTime,type="l",col="red")
lines(data1$Sub_metering_3~data1$DateTime,type="l",col="blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c('black', 'red', 'blue'),lwd=1)
plot(data1$Voltage~data1$DateTime,xlab="",ylab = "Voltage",type="l")
plot(data1$Global_reactive_power~data1$DateTime,xlab="",ylab = "Global_reactive_power",type="l")
dev.off()



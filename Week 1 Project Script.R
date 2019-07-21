#get the data
dataFile <- "~/Downloads/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";")
week1data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#define the variables
globalActivePower <- as.numeric(week1data$Global_active_power)
datetime <- strptime(paste(week1data$Date, week1data$Time, sep = ""), "%d/%m/%Y %H:%M:%S")
subMetering1 <- as.numeric(week1data$Sub_metering_1)
subMetering2 <- as.numeric(week1data$Sub_metering_2)
subMetering3 <- as.numeric(week1data$Sub_metering_3)
Voltage <- as.numeric(week1data$Voltage)
globalreactivepower <- as.numeric(week1data$Global_reactive_power)

#plot1
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()

#plot2
png("plot2.png")
plot(datetime, plot2, type = "l", ylab = "Global Active Power (kilowatts)")
dev.off()

#plot3
png("plot3.png")
plot(datetime, subMetering1, type = "l", ylab = "Energy Submetering")
lines(datetime, subMetering2, type = "l", col = "red")
lines(datetime, subMetering3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"))
dev.off()

#plot4
png("plot4.png")
par(mfrow = c(2, 2))
plot(datetime, globalActivePower, type = "l", ylab = "Global Active Power")
plot(datetime, Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
plot(datetime, subMetering1, type = "l", ylab = "Energy sub metering")
lines(datetime, subMetering2, type = "l", col = "red")
lines(datetime, subMetering3, type = "l", col = "blue")
legend("topright", col=c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(datetime, globalreactivepower, type = "l", xlab = "datetime", ylab = "Global_Reactive_Power")
dev.off()



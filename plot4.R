header <- read.table("household_power_consumption.txt", header = FALSE, nrows = 1, sep=";", stringsAsFactors = FALSE )
data <- read.table("household_power_consumption.txt",header = FALSE, skip = 66637, nrows = 2881, sep=";" )
colnames(data) <- unlist(header)

data$Date <- as.Date(data$Date, format="%d/%m/%Y", tz="America/Los_Angeles")

data$Date <- as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")

png(filename="plot4.png")
par(mfcol=c(2,2))
plot(data$Date, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

plot(data$Date, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(data$Date, data$Sub_metering_2, col="red")
lines(data$Date, data$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1, bty = "n")

plot(data$Date, data$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(data$Date, data$Global_reactive_power, type="l", xlab="datetime", ylab = "Global_reactive_power")

dev.off()
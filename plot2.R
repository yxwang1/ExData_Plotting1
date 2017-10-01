header <- read.table("household_power_consumption.txt", header = FALSE, nrows = 1, sep=";", stringsAsFactors = FALSE )
data <- read.table("household_power_consumption.txt",header = FALSE, skip = 66637, nrows = 2881, sep=";" )
colnames(data) <- unlist(header)

data$Date <- as.Date(data$Date, format="%d/%m/%Y", tz="America/Los_Angeles")

data$Date <- as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")

png(filename="plot2.png")
plot(data$Date, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
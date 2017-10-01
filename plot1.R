header <- read.table("household_power_consumption.txt", header = FALSE, nrows = 1, sep=";", stringsAsFactors = FALSE )
data <- read.table("household_power_consumption.txt",header = FALSE, skip = 66637, nrows = 2881, sep=";" )
colnames(data) <- unlist(header)

png(filename="plot1.png")
hist(data$Global_active_power, xlab="Global Active Power", ylab = "Frequency", main = "Global Active Power", col="red")
dev.off()
# Read dataset and subset for dates of interest:

dat <- read.delim("household_power_consumption.txt", header = T, sep = ";", na.strings = "?", stringsAsFactors = F)
dat$DateTime <- as.POSIXct(paste(dat$Date, dat$Time), format = "%d/%m/%Y %H:%M:%S")
dat$Date <- as.Date(dat$Date, format = "%d/%m/%Y")
plotDat <- subset(dat, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

# Create plot and .png:

png("plot3.png")
par(mar = c(5, 5, 3, 3))
with(plotDat,{
  plot(DateTime, Sub_metering_1, type = "l", main = "", xlab = "", ylab = "Energy sub metering")
  lines(DateTime, Sub_metering_2, col = "red")
  lines(DateTime, Sub_metering_3, col = "blue")
  legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=c(1,1,1),col=c("black", "red","blue"))
})
dev.off()
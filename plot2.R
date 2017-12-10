# Read dataset and subset for dates of interest:

dat <- read.delim("household_power_consumption.txt", header = T, sep = ";", na.strings = "?", stringsAsFactors = F)
dat$DateTime <- as.POSIXct(paste(dat$Date, dat$Time), format = "%d/%m/%Y %H:%M:%S")
dat$Date <- as.Date(dat$Date, format = "%d/%m/%Y")
plotDat <- subset(dat, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

# Create plot and .png:

png("plot2.png")
par(mar = c(5, 5, 4, 2))
with(plotDat, plot(DateTime, Global_active_power, type = "l", main = "", xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off()
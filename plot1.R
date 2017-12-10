# Read dataset and subset for dates of interest:

dat <- read.delim("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)
dat$Date <- as.Date(dat$Date, format = "%d/%m/%Y")
dat$DateTime <- as.POSIXct(paste(dat$Date, dat$Time), format = "%d/%m/%Y %H:%M:%S")
plotDat <- subset(dat, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

# Create plot and .png:

png("plot1.png")
par(mar = c(5, 5, 4, 2))
hist(plotDat$Global_active_power, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")
dev.off()
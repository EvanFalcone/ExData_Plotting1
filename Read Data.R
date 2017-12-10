# Read data, convert to Date and subset for relevant dates:

dat <- read.delim("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)
dat$Date <- as.Date(dat$Date, format = "%d/%m/%Y")
plotDat <- subset(dat, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
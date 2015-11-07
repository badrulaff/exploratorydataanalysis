# filename: plot1.R
# purpose: plot histogram with PNG
fileUrl <- "./data/household_power_consumption.txt"
data <- read.table(fileUrl, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
datafiltered <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#convert to numeric
globalActivePower <- as.numeric(datafiltered$Global_active_power)

#device PNG
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

#close device
dev.off()
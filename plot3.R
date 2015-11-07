# filename: plot3.R
# purpose: plot histogram with PNG
library(lubridate)

fileUrl <- "./data/household_power_consumption.txt"
data <- read.table(fileUrl, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
dfa <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
df <- na.omit(dfa)

#convert to weekday
df$DateVal <- strptime(paste(df$Date, df$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
#wd <- wday(df$Date, label=TRUE)

globalActivePower <- as.numeric(df$Global_active_power)
date11<- df$DateVal
Sub_metering_1 <- as.numeric(df$Sub_metering_1)
Sub_metering_2 <- as.numeric(df$Sub_metering_2)
Sub_metering_3 <- as.numeric(df$Sub_metering_3)

#plotting
png("plot3.png", width=480, height=480)
plot(date11, Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(date11, Sub_metering_2, type="l", col="red")
lines(date11, Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()

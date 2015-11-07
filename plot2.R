# filename: plot1.R
# purpose: plot histogram with PNG
library(lubridate)

fileUrl <- "./data/household_power_consumption.txt"
data <- read.table(fileUrl, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
dfa <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
df <- na.omit(dfa)

#convert to weekday
df$DateVal <- strptime(paste(df$Date, df$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
wd <- wday(df$Date, label=TRUE)

globalActivePower <- as.numeric(df$Global_active_power)
date11<- df$DateVal

png("plot2.png", width=480, height=480)
plot(date11, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

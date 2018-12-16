
## PLOT4

rm(list = ls(all = TRUE))
dataset <- "./data/household_power_consumption.txt" 
data <- read.table(dataset, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
names(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
data1 <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

dfecha <- strptime(paste(data1$Date, data1$Time, sep=" "), "%d/%m/%Y %H:%M:%S")  
variable <- as.numeric(data1$Global_active_power)

variable2 <- as.numeric(data1$Global_reactive_power)
voltage <- as.numeric(data1$Voltage)
sub_metering_1 <- as.numeric(data1$Sub_metering_1)
sub_metering_2 <- as.numeric(data1$Sub_metering_2)
sub_metering_3 <- as.numeric(data1$Sub_metering_3)
png("plot4.png", width=480, height=480) 
par(mfrow = c(2, 2))  

plot(dfecha, variable, type="l", xlab="", ylab="Global Active Power", cex=0.2) 
plot(dfecha, voltage, type="l", xlab="datetime", ylab="Voltage") 
plot(dfecha, sub_metering_1, type="l", ylab="Energy Submetering", xlab="") 
lines(dfecha, sub_metering_2, type="l", col="red") 
lines(dfecha, sub_metering_3, type="l", col="blue") 
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o") 
plot(dfecha, variable2, type="l", xlab="datetime", ylab="Global_reactive_power") 
dev.off()  

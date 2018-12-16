
## PLOT1

rm(list = ls(all = TRUE))
dataset <- "./data/household_power_consumption.txt" 
data <- read.table(dataset, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
names(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
data1 <- data[data$Date %in% c("1/2/2007","2/2/2007") ,] 
str(data1)

png("plot1.png", width=480, height=480) 
hist(as.numeric(data1$Global_active_power), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)") 
dev.off()  

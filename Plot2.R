
## PLOT2

rm(list = ls(all = TRUE))
dataset <- "./data/household_power_consumption.txt" 
data <- read.table(dataset, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
names(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
data1 <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

dfecha <- strptime(paste(data1$Date, data1$Time, sep=" "), "%d/%m/%Y %H:%M:%S")  
variable <- as.numeric(data1$Global_active_power)
png("plot2.png", width=480, height=480)

plot(dfecha, variable, type="l", xlab="", ylab="Global Active Power (kilowatts)") 
dev.off()

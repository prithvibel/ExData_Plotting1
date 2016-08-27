#read the data
data <- read.table("household_power_consumption.txt", sep=";", 
                   stringsAsFactors = FALSE, header = TRUE)

#subset relevant data
rel.data <- subset(data, Date %in% c("1/2/2007","2/2/2007"))
rel.data$Global_active_power <- as.numeric(rel.data$Global_active_power)
rel.data$Global_reactive_power <- as.numeric(rel.data$Global_reactive_power)
rel.data$Date <- strptime(paste(rel.data$Date, rel.data$Time, sep=" "), 
                          "%d/%m/%Y %H:%M:%S")
rel.data$Voltage <- as.numeric(rel.data$Voltage)
rel.data$Sub_metering_1 <- as.numeric(rel.data$Sub_metering_1)
rel.data$Sub_metering_2 <- as.numeric(rel.data$Sub_metering_2)
rel.data$Sub_metering_3 <- as.numeric(rel.data$Sub_metering_3)

#create file and plots
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

with(rel.data, plot(Date, Global_active_power, type="l", xlab="", 
                    ylab="Global Active Power"))

with(rel.data, plot(Date, Voltage, type="l", xlab="datetime", ylab="Voltage"))

with(rel.data, plot(Date, Sub_metering_1, type="l", ylab="Energy Submetering", xlab=""))
with(rel.data, lines(Date, Sub_metering_2, type="l", col="red"))
with(rel.data, lines(Date, Sub_metering_3, type="l", col="blue"))
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1,
       col=c("black","red","blue"))

with(rel.data, plot(Date, Global_reactive_power, type="l", xlab="datetime", 
                    ylab="Global_reactive_power"))

dev.off()
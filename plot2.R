#read the data
data <- read.table("household_power_consumption.txt", sep=";", 
                   stringsAsFactors = FALSE, header = TRUE)

#subset relevant data
rel.data <- subset(data, Date %in% c("1/2/2007","2/2/2007"))
rel.data$Global_active_power <- as.numeric(rel.data$Global_active_power)
rel.data$Date <- strptime(paste(rel.data$Date, rel.data$Time, sep=" "), 
                          "%d/%m/%Y %H:%M:%S")  

#create file and plot
png("plot2.png", width=480, height=480)
with(rel.data, plot(Date, Global_active_power, type="l", xlab="", 
                    ylab="Global Active Power (kilowatts)"))
dev.off()
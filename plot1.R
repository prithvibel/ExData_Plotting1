#read the data
data <- read.table("household_power_consumption.txt", sep=";", 
                   stringsAsFactors = FALSE, header = TRUE)

#subset relevant data
rel.data <- subset(data, Date %in% c("1/2/2007","2/2/2007"))
rel.data$Global_active_power <- as.numeric(rel.data$Global_active_power)

#create file and the histogram
png("plot1.png", width=480, height=480)
hist(rel.data$Global_active_power, col ="red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.off()

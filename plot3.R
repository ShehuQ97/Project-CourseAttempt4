data <- read.table("household_power_consumption.txt",
                   header = TRUE,
                   sep = ";",
                   na.strings = "?")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
subset_data <- subset(data,
                      Date == "2007-02-01" | Date == "2007-02-02")
subset_data$Global_active_power <- as.numeric(subset_data$Global_active_power)
png("plot1.png", width = 480, height = 480)
hist(subset_data$Global_active_power,
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")
dev.off()

data <- read.table("household_power_consumption.txt",
                   header = TRUE,
                   sep = ";",
                   na.strings = "?")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
subset_data <- subset(data,
                      Date == "2007-02-01" | Date == "2007-02-02")
datetime <- as.POSIXct(paste(subset_data$Date, subset_data$Time))
gap <- as.numeric(subset_data$Global_active_power)
png("plot2.png", width = 480, height = 480)
plot(datetime, gap, type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")
dev.off()


data <- read.table("household_power_consumption.txt",
                   header = TRUE,
                   sep = ";",
                   na.strings = "?")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
subset_data <- subset(data,
                      Date == "2007-02-01" | Date == "2007-02-02")
datetime <- as.POSIXct(paste(subset_data$Date, subset_data$Time))
sub1 <- as.numeric(subset_data$Sub_metering_1)
sub2 <- as.numeric(subset_data$Sub_metering_2)
sub3 <- as.numeric(subset_data$Sub_metering_3)
png("plot3.png", width = 480, height = 480)
plot(datetime, sub1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(datetime, sub2, col = "red")
lines(datetime, sub3, col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col = c("black","red","blue"), lty = 1)
dev.off()



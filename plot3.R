# Coursera Data Science: Exploratory Data Analysis

# Course project 1: plot3

# read data
data <- read.table("./household_power_consumption.txt", 
                   stringsAsFactors = FALSE, header = TRUE, sep =";"  )
  
# Create column in table
Time_Date <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
data <- cbind(data, Time_Date)

# convert the class of column to correct class
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$Time <- format(data$Time, format="%H:%M:%S")
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)
  
# subset the data
subsetdata <- subset(data, Date >= "2007-02-01" & Date <="2007-02-02")

#plot the data sub_matering
png("plot3.png", width=480, height=480)
with(subsetdata, plot(Time_Date, Sub_metering_1, type="l", xlab="Day", ylab="Energy sub metering"))
lines(subsetdata$Time_Date, subsetdata$Sub_metering_2,type="l", col= "red")
lines(subsetdata$Time_Date, subsetdata$Sub_metering_3,type="l", col= "blue")
legend(c("topright"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty= 1, lwd=2, col = c("black", "red", "blue"))
dev.off()


# Coursera Data Science: Exploratory Data Analysis

# Course project 1: plot2

# read data
data <- read.table("./household_power_consumption.txt", 
                   stringsAsFactors = FALSE, header = TRUE, sep =";"  )
  
Time_Date <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
data <- cbind(data, Time_Date)
  
# convert class of each column to correct class
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$Time <- format(data$Time, format="%H:%M:%S")
data$Global_active_power <- as.numeric(data$Global_active_power)
  
# subset the data
subsetdata <- subset(data, Date >= "2007-02-01" & Date <="2007-02-02")

# plot global active power vs date & time
png("plot2.png", width=480, height=480)
with(subsetdata, plot(Time_Date, Global_active_power, type="l", 
                      xlab="Day", ylab="Global Active Power (kilowatts)"))
dev.off()

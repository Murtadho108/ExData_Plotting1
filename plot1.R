
# Coursera Data Science: Exploratory Data Analysis

# Course project 1: Plot1

# read data
data <- read.table("./household_power_consumption.txt", 
                    stringsAsFactors = FALSE, header = TRUE, sep =";"  )
  
# change the data variable to Date class
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

#convert dates and times 
data$Time <- format(data$Time, format="%H:%M:%S")
  
data$Global_active_power <- as.numeric(data$Global_active_power)
  
# subset the data
subsetdata <- subset(data, Date >= "2007-02-01" & Date <="2007-02-02")
  
# plot histogram of global active power for those two days
png("plot1.png", width=480, height=480)
hist(subsetdata$Global_active_power , col="red", border="black", main ="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()

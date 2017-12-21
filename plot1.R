mydata <- read.table('/Users/apple/Downloads/household_power_consumption.txt', sep = ';', header = TRUE)

mydata$Date <- strptime(mydata$Date, format = "%d/%m/%Y")

mydata$Date <- as.Date(mydata$Date)

new_data <- mydata[mydata$Date >= as.Date(strptime("1/2/07", "%d/%m/%y")) & mydata$Date <= as.Date(strptime("2/2/07", "%d/%m/%y")), ]

new_data$Global_active_power = as.numeric(new_data$Global_active_power)


library(ggplot2)

# qplot(mydata$Global_active_power/1000, geom = "histogram", 
#       xlab = "Global Active Power (kilowatt)",
#       ylab = "Frequency", 
#       main = "Global Active Power",
#       fill=I("red"),
#       col=I("black"),
#       binwidth=0.5,
#       xlim = c(0, 6))


png(filename = "/Users/apple/Desktop/exploratory-data-analysis-course/ExData_Plotting1/plot1.png",
     width = 480, height = 480)
hist(x = new_data$Global_active_power/1000, col = 'red', xlab = 'Global Active Power (kilowatt)',
     main = "Global Active Power", xlim = c(0, 6))
dev.off()


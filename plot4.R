mydata <- read.table('/Users/apple/Downloads/household_power_consumption.txt', sep = ';', header = TRUE)

mydata$Date <- strptime(mydata$Date, format = "%d/%m/%Y")

mydata$Date <- as.Date(mydata$Date)

new_data <- mydata[mydata$Date >= as.Date(strptime("1/2/07", "%d/%m/%y")) & mydata$Date <= as.Date(strptime("2/2/07", "%d/%m/%y")), ]

new_data$Global_active_power = as.numeric(new_data$Global_active_power)

new_data$full_date = as.POSIXct(paste(new_data$Date, new_data$Time), format="%Y-%m-%d %H:%M:%S")

library(ggplot2)

library(reshape2)

png(filename = "/Users/apple/Desktop/exploratory-data-analysis-course/ExData_Plotting1/plot4.png",
    width = 480, height = 480)

par(mfrow=c(2,2), mar=c(4,4,1,1))


plot(new_data$full_date, new_data$Global_active_power/1000, type = 'l', ylab = "Global Active Power", xlab = "")

plot(new_data$full_date, as.numeric(as.character(new_data$Voltage)), type = 'l', xlab = "datetime", ylab = "Voltage")



plot(x=new_data$full_date, y=new_data$Sub_metering_1, type = 'l', col="black", xlab = "", ylab = "Energy sub metering", yaxt="n")
lines(x=new_data$full_date, y=new_data$Sub_metering_2, type = 'l', col="red")
lines(x=new_data$full_date, y=new_data$Sub_metering_3, type = 'l', col="blue")
axis(side=2,at=seq(0,30,10),lwd=1)
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),col=c("black", "red", "blue"), lty = 1, cex = 0.75)

plot(new_data$full_date, as.double(as.character(new_data$Global_reactive_power)), type = 'l', ylab = "Global_reactive_power", xlab = "")



dev.off()


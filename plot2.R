mydata <- read.table('/Users/apple/Downloads/household_power_consumption.txt', sep = ';', header = TRUE)

mydata$Date <- strptime(mydata$Date, format = "%d/%m/%Y")

mydata$Date <- as.Date(mydata$Date)

new_data <- mydata[mydata$Date >= as.Date(strptime("1/2/07", "%d/%m/%y")) & mydata$Date <= as.Date(strptime("2/2/07", "%d/%m/%y")), ]

new_data$Global_active_power = as.numeric(new_data$Global_active_power)

new_data$full_date = as.POSIXct(paste(new_data$Date, new_data$Time), format="%Y-%m-%d %H:%M:%S")


library(ggplot2)




png(filename = "/Users/apple/Desktop/exploratory-data-analysis-course/ExData_Plotting1/plot2.png",
    width = 480, height = 480)


g = ggplot(data = new_data, aes(full_date, Global_active_power/1000 ))
g = g + geom_line() + ylab("Global Active Power (kilowatts)")  + xlab("")
g + scale_x_datetime(date_breaks = "1 day", date_labels = "%A")

dev.off()


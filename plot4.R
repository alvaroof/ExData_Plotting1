#import and prepare data to be displayed


household <- read.table("household_power_consumption.txt", 
                        sep = ";", 
                        header = TRUE,
                        na.strings = "?",
                        stringsAsFactors = FALSE)

household <- rbind(subset(household, household$Date == "1/2/2007"), 
                   subset(household, household$Date == "2/2/2007"))

household$Date.Time <- paste(household$Date, household$Time, sep = " ")
household$Date.Time <- strptime(household$Date.Time, format = "%e/%m/%Y %H:%M:%S")

#--------------------------------------------------------------------------------------#
#make the plot

png(filename = "plot4.png", width = 480, height = 480)

par(mar = c(4,4,2,1), mfrow = c(2,2))

##plot1
plot(household$Date.Time,
     household$Global_active_power, 
     ylab = "Global Active Power (kilowatts)",
     xlab = "", type = "n")
lines(household$Date.Time,
      household$Global_active_power)


##other plot
plot(household$Date.Time,
     household$Voltage, 
     ylab = "Voltage",
     xlab = "datetime", type = "n")
lines(household$Date.Time,
      household$Voltage)

#plot3
with(household,{
    plot(Date.Time,
         Sub_metering_1, 
         ylab = "Energy sub metering",
         xlab = "", type = "n")
    lines(Date.Time,
          Sub_metering_1,
          col = "black")
    lines(Date.Time,
          Sub_metering_2,
          col = "red")
    lines(Date.Time,
          Sub_metering_3,
          col = "blue")
    legend("topright", lty = 1, col = c("black", "red", "blue"),
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})

##other plot
plot(household$Date.Time,
     household$Global_reactive_power, 
     ylab = "Global_reactive_power",
     xlab = "datetime", type = "n")
lines(household$Date.Time,
      household$Global_reactive_power)

dev.off()
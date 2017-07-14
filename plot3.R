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

png(filename = "plot3.png", width = 480, height = 480)
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
dev.off()

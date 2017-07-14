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


#make the plot
png(filename = "plot2.png", width = 480, height = 480)
plot(household$Date.Time,
     household$Global_active_power, 
     ylab = "Global Active Power (kilowatts)",
     xlab = "", type = "n")
lines(household$Date.Time,
      household$Global_active_power)
dev.off()

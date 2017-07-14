#import and prepare data to be displayed

household <- read.table("household_power_consumption.txt", 
                   sep = ";", 
                   header = TRUE,
                   na.strings = "?",
                   stringsAsFactors = FALSE)

household <- rbind(subset(household, household$Date == "1/2/2007"), 
                   subset(household, household$Date == "2/2/2007"))


#make the plot
png(filename = "plot1.png", width = 480, height = 480)
hist(household$Global_active_power, 
     col = "red",
     breaks = 15,
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")
dev.off()

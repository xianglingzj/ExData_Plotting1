plot3 <- function(){
  startDate <- as.Date("2007-02-01", format="%Y-%m-%d")
  endDate <- as.Date("2007-02-02", format="%Y-%m-%d")
  png(filename="plot3.png")
  table <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
  table$Date <- as.Date(table$Date, format="%d/%m/%Y")
  effectiveTable <- subset(table, (Date %in% c(startDate, endDate)))
  effttime <- strptime(paste(effectiveTable$Date, effectiveTable$Time), 
                       format="%Y-%m-%d %H:%M:%S")
  plot(effttime, effectiveTable$Sub_metering_1, type="l", 
       ylab="Energy sub metering", xlab="")
  lines(effttime, effectiveTable$Sub_metering_2, col="red")
  lines(effttime, effectiveTable$Sub_metering_3, col="blue")
  legend("topright", col=c("black", "red", "blue"), 
         lwd=c(2.5,2.5),c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  dev.off()
}
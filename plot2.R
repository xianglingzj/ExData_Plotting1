plot2 <- function(){
  startDate <- as.Date("2007-02-01", format="%Y-%m-%d")
  endDate <- as.Date("2007-02-02", format="%Y-%m-%d")
  png(filename="plot2.png")
  table <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
  table$Date <- as.Date(table$Date, format="%d/%m/%Y")
  effectiveTable <- subset(table, (Date %in% c(startDate, endDate)))
  effttime <- strptime(paste(effectiveTable$Date, effectiveTable$Time), 
                       format="%Y-%m-%d %H:%M:%S")
  plot(effttime, effectiveTable$Global_active_power, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  dev.off()
}
plot1 <- function(){
  startDate <- as.Date("2007-02-01", format="%Y-%m-%d")
  endDate <- as.Date("2007-02-02", format="%Y-%m-%d")
  png(filename="plot1.png")
  table <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
  table$Date <- as.Date(table$Date, format="%d/%m/%Y")
  effectiveTable <- subset(table, (Date %in% c(startDate, endDate)))
  hist(effectiveTable$Global_active_power, col="red", main="Global Active Power",xlab="Global Active Power (kilowatts)")
  dev.off()
}
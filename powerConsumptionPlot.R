par(mfrow = c(2,2))
consumption <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
cons <- data.frame(cdate=as.POSIXlt(paste(consumption$Date, consumption$Time),format="%d/%m/%Y %H:%M:%S"),
                   active_power=consumption$Global_active_power,
                   reactive_power=consumption$Global_reactive_power,
                   voltage=consumption$Voltage,
                   submeter1=consumption$Sub_metering_1,
                   submeter2=consumption$Sub_metering_2,
                   submeter3=consumption$Sub_metering_3)
## Subset columns
cons <- cons[is.element(format(cons$cdate,"%m-%d-%y"),c("02-01-07","02-02-07")),]
## Plot 1 Global Active power over time
plot(cons$cdate, cons$active_power, type="n", 
     main = "Global Active Power",
     ylab = "Global Active Power (kilowatts)",
     xlab = "")
lines(cons$cdate, cons$active_power)
## Plot 2 Voltage over time
plot(cons$cdate, cons$voltage, type="l",
     ylab="Voltage", xlab="datetime")
## Plot 3 Energy submetering
plot(cons$cdate, cons$submeter1,  type="n", 
     main = "Global Active Power",
     ylab = "Energy sub metering",
     xlab = "")
lines(cons$cdate, cons$submeter1, col="black")
lines(cons$cdate, cons$submeter2, col="red")
lines(cons$cdate, cons$submeter3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=c(1,1,1),col=c("black","red", "blue"),bty="n")
## Plot 4 Global Active Power
plot(cons$cdate, cons$reactive_power, type="l", 
     ylab = "Global_reactive_power",
     xlab = "")
##lines(cons$cdate, cons$reactive_power)

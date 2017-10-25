consumption <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
cons <- data.frame(cdate=as.POSIXlt(paste(consumption$Date, consumption$Time),format="%d/%m/%Y %H:%M:%S"),
                   submeter1=consumption$Sub_metering_1,
                   submeter2=consumption$Sub_metering_2,
                   submeter3=consumption$Sub_metering_3)
## Subset columns
cons <- cons[is.element(format(cons$cdate,"%m-%d-%y"),c("02-01-07","02-02-07")),]
## Create plot
plot(cons$cdate, cons$submeter1,  type="n", 
     main = "Global Active Power",
     ylab = "Energy sub metering",
     xlab = "")
##axis(1, at=cons$cdate, labels=format(cons$cdate, "%a"))
## Add Lines
lines(cons$cdate, cons$submeter1, col="black")
lines(cons$cdate, cons$submeter2, col="red")
lines(cons$cdate, cons$submeter3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=c(1,1,1),col=c("black","red", "blue"))
##lines(cons$submeter1, cons$cdate, col="red")

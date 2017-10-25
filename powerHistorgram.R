## Read file
consumption <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
cons <- data.frame(cdate=as.POSIXlt(paste(consumption$Date, consumption$Time),format="%d/%m/%Y %H:%M:%S"),
                   active_power=consumption$Global_active_power)
cons <- cons[is.element(format(cons$cdate,"%m-%d-%y"),c("02-01-07","02-02-07")),]
## Subset columns
## Product graph
hist(as.numeric(cons$active_power), col="red", 
                       xlab="Global Active Power (kilowatts)", 
                       main = "Global Active Power")

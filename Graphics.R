#Loading the BASE#

BASE <- read.table("household_power_consumption.txt", header= TRUE, 
                   sep=";", stringsAsFactors=FALSE, dec=".")

View(BASE)


#Dates 2007-02-01 and 2007-02-02#

subdata <- BASE[BASE$Date %in% c("1/2/2007","2/2/2007"),]

globalActivePower <- as.numeric(subdata$Global_active_power)
globalReactivePower <- as.numeric(subdata$Global_reactive_power)
voltage <- as.numeric(subdata$Voltage)
subMetering1 <- as.numeric(subdata$Sub_metering_1)
subMetering2 <- as.numeric(subdata$Sub_metering_2)
subMetering3 <- as.numeric(subdata$Sub_metering_3)

#Created the histogram of variable Global Active Power#

hist(globalActivePower, col="red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")

#Create the Time series of Global Active Power (kilowatts)#

st <- strptime(paste(subdata$Date, subdata$Time, sep=" "), 
                     "%d/%m/%Y %H:%M:%S") 
plot(st, globalActivePower, type="l", xlab="", 
     ylab="Global Active Power (kilowatts)")

#Creating plot for submetering#

plot(st, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(st, subMetering2, type="l", col="red")
lines(st, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, lwd=2.5, col=c("black", "red", "blue"))


#Creating various plots#

par(mfrow = c(2, 2)) 

# First plot
plot(st, globalActivePower, type="l", xlab="", 
     ylab="Global Active Power", cex=0.2)

# Second plot
plot(st, voltage, type="l", xlab="datetime", ylab="Voltage")

# Third plot
plot(st, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(st, subMetering2, type="l", col="red")
lines(st, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

# Fourth plot
plot(st, globalReactivePower, type="l", xlab="datetime", 
     ylab="Global_reactive_power", cex=0.2)

# Download, unzip, load and prepare data
source("Proj 1.R")

par(mfcol= c(2,2), mar= c(4,4,1,2) + .1) # mar=c(4,4,2,2)

# Plot #(1,1)
plot(x= data$DateTime, y=data$Global_active_power, type="l", xlab="", ylab="Global Active Power")

# Plot #(2,1)
plot(x=data$DateTime, y= data$Sub_metering_1,type="n", xlab="", ylab="Energy sub metering")

lines(x= data$DateTime, y= data$Sub_metering_1, col="black")
lines(x= data$DateTime, y= data$Sub_metering_2, col="red")
lines(x= data$DateTime, y= data$Sub_metering_3, col="blue")

legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col= c("black","red","blue"),
       lty=c(1,1,1), cex=.75, bty= "n")

# Plot #(1,2)
plot(x=data$DateTime, y= data$Voltage, xlab= "datetime", ylab= "Voltage", type = "l")

# Plot #(2,2)
plot(x=data$DateTime, y= data$Global_reactive_power, xlab= "datetime", ylab= "Global_reactive_power", type = "l")

if (!file.exists("plot"))
    dir.create("plot")

dev.copy(png, file="plot/plot4.png")
dev.off()

# Download, unzip, load and prepare data
source("Proj 1.R")

plot(x=data$DateTime, y= data$Sub_metering_1,type="n", xlab="", ylab="Energy sub metering")

lines(x= data$DateTime, y= data$Sub_metering_1, col="black")
lines(x= data$DateTime, y= data$Sub_metering_2, col="red")
lines(x= data$DateTime, y= data$Sub_metering_3, col="blue")

legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col= c("black","red","blue"),
       lty=c(1,1,1), cex=.75,
       xjust = 1)

if (!file.exists("plot"))
    dir.create("plot")

dev.copy(png, file="plot/plot3.png")
dev.off()

